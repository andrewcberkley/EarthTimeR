import array, calendar, csv, math, time

def LonLatToPixelXY(lonlat):
  (lon, lat) = lonlat
  x = (lon + 180.0) * 256.0 / 360.0
  # y = 128.0 - math.log(math.tan((lat + 90.0) * math.pi / 360.0)) * 128.0 / math.pi
  #"ValueError: math domain error"
  #ValueError: math domain error
  #https://stackoverflow.com/questions/15890503/valueerror-math-domain-error
  y = 128.0 - math.log1p(math.tan((lat + 90.0) * math.pi / 360.0)) * 128.0 / math.pi
  return [x, y]

def FormatEpoch(datestr, formatstr):
  return calendar.timegm(time.strptime(datestr, formatstr))

def PackColor(color):    
  return color[0] + color[1] * 256.0 + color[2] * 256.0 * 256.0;

def hex2rgb(h):
  return tuple(int(h.strip("#")[i:i+2], 16) for i in (0, 2 ,4))

def create_python_pointmap(dataframe, latitude_column, longitude_column, value_column, date_column, date_format, red, green, blue):
  raw_data = []
  with open(dataframe+".csv", encoding="utf8") as f:
    reader = csv.DictReader(f, delimiter=",")
    for row in reader:
      raw_data.append(row)

  len(raw_data)
  raw_data[0]

  points = []
  for row in raw_data:
    x,y = LonLatToPixelXY([float(row[latitude_column]), float(row[longitude_column])])
    points.append(x)
    points.append(y)
    points.append(math.sqrt(float(row[value_column]) + 1.0))
    points.append(PackColor([red, green, blue]))    
    points.append(FormatEpoch(row[date_column], date_format))
  array.array('f', points).tofile(open(dataframe+".bin", 'wb'))
  