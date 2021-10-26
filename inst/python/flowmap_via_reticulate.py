import csv, glob, json, math, os, re

def process_row(row):
    year, org, dst, val = row                
    org_wm = centroids_by_iso_alpha_3[org]["epsg_3857"]
    dst_wm = centroids_by_iso_alpha_3[dst]["epsg_3857"]
    mid_wm = [((dst_wm[0] + org_wm[0]) / 2), ((dst_wm[1] + org_wm[1]) / 2)]  
    mid_offset = [0,0]                
    dist = math.sqrt(math.pow(dst_wm[0] - org_wm[0],2) +  math.pow(dst_wm[1] - org_wm[1],2))
    if abs(dst_wm[1] - org_wm[1]) > abs(dst_wm[0] - org_wm[0]):
        if dst_wm[1] > org_wm[1]:
            mid_offset[0] = 1
            mid_wm[0] += dist*0.5
        else:
            mid_offset[0] = -1
            mid_wm[0] -= dist*0.5
    else:
        if dst_wm[0] < org_wm[0]:
            mid_offset[1] = 1   
            mid_wm[1] += dist*0.5
        else: 
            mid_offset[1] = -1
            mid_wm[1] -= dist*0.5
    return {"year": year, 
            "org": org.lower(),
            "org_wm": org_wm,
            "dst_wm": dst_wm,
            "dst": dst.lower(),
            "mid_wm": mid_wm,
            "mid_offset": mid_offset,
            "export_val": val
            }

def to_json(col, fname):
    with open(fname, "w") as f:
        json.dump(col, f)
        
def hex2rgb(h):
    return tuple(int(h.strip("#")[i:i+2], 16) for i in (0, 2 ,4))

def get_header_and_lines(fname):
    lines = []
    with open(fname) as f:
        for l in f.readlines():
            lines.append(l)
    return lines[5], lines[6:-1]

def find_name(name, features):
    match = False
    for f in features:
        if name in f["properties"]["names"]:
            match = True
            break
    if match:
        return f["properties"]["iso_alpha-3"]
    else:
        return None

def create_python_flowmap(dataframe, origin, destination, value_column, date_column, centroids_json, output_dir):
    raw_data = []
    with open(dataframe+".csv", encoding="utf8") as f:
        reader = csv.DictReader(f,delimiter=",")
        for row in reader:
            raw_data.append(row)

    #raw_data

    # Standardize names
    names = []
    for row in raw_data:
        org = row[origin]
        dst = row[destination]
        if org not in names:
            names.append(org)
        if dst not in names:
            names.append(dst)


    with open("country-centroids.geojson") as f:
        centroids = json.load(f)

    with open(centroids_json) as f:
        centroids_by_iso_alpha_3 = json.load(f)

    names_to_iso = {}
    for n in names:
        iso = find_name(n, centroids["features"])
        if iso is None:
            m = re.search(r"\((.+)\)", n)
            if m is None:
                    if n == "Syria rebels*":
                        alt_n = "Syria"
                        iso = find_name(alt_n, centroids["features"])
                        names_to_iso[n] = iso

                    elif n == "Libya HoR":
                        alt_n = "Libya"
                        iso = find_name(alt_n, centroids["features"])
                        names_to_iso[n] = iso
                    elif n == "Ukraine Rebels*":
                        alt_n = "Ukraine"
                        iso = find_name(alt_n, centroids["features"])
                        names_to_iso[n] = iso
                    elif n == "Lebanon Palestinian rebels*":
                        alt_n = "Lebanon"
                        iso = find_name(alt_n, centroids["features"])
                        names_to_iso[n] = iso
                    elif n == "Libya GNC":
                        alt_n = "Libya"
                        iso = find_name(alt_n, centroids["features"])
                        names_to_iso[n] = iso
                    else:
                        print ("No match for %s" % n)
            else:
                alt_n = m.group(0).replace("(","").replace(")","").split("/")[0]
                iso = find_name(alt_n, centroids["features"])
                if iso is not None:
                    names_to_iso[n] = iso
        else:
            names_to_iso[n] = iso

    # Get all years
    years = []
    for row in raw_data:
        if row[date_column] not in years: #and row[date_column] != 'Yes' and row[date_column] != 'No':
            years.append(row[date_column])
    years.sort()
    years

    collection = {}
    for y in years:
        collection[y] = {}
        
    for row in raw_data:
        year = row[date_column]
        org = row[origin]
        dst = row[destination]
        if year in years and org in names_to_iso and dst in names_to_iso:
            o = names_to_iso[org]
            d = names_to_iso[dst]
            if o not in collection[year]: 
                collection[year][o] = {}
            if d not in collection[year][o]:
                collection[year][o][d] = 0
            collection[year][o][d] += float(row[value_column])
                

    out_dir = output_dir
    if not os.path.exists(out_dir):
        os.makedirs(out_dir)
        
    for year in years:
        col = []
        fname = os.path.join(out_dir, str(year) + ".json")
        for org in collection[year]:
            for dst in collection[year][org]:
                val = collection[year][org][dst]
                col.append(process_row([year,org,dst,val]))
        to_json(col, fname)

    #fname

    #!rsync -rcav ../data/dataframe_name_database USERNAME@HOSTNAME:/FILE_PATH




