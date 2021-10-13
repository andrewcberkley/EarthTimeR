#' A Google Authorization Function
#'
#' You'll need to authorize Google Drive to view and manage your EarthTime data layers. In EarthTime R, this is done through the "Tidyverse". By default, you are directed to a web browser, asked to sign in to your Google account, and to grant Google Drive permission to operate on your behalf with Google Drive. By default, with your permission, these user credentials are cached in a folder below your home directory, from where they can be automatically refreshed, as necessary. Storage at the user level means the same token can be used across multiple projects and tokens are less likely to be synced to the cloud by accident.If you are interacting with R within a browser (applies to RStudio Server, RStudio Workbench, and RStudio Cloud), you need a variant of this flow, known as out-of-band auth ("oob"). If this does not happen automatically, you can request it yourself with "use_oob = TRUE" or, more persistently, by setting an option via "options(gargle_oob_default = TRUE)".

#' @param email Optional. Allows user to target a specific Google identity. If specified, this is used for token lookup, i.e. to determine if a suitable token is already available in the cache. If no such token is found, email is used to pre-select the targetted Google identity in the OAuth chooser. Note, however, that the email associated with a token when it's cached is always determined from the token itself, never from this argument. Use NA or FALSE to match nothing and force the OAuth dance in the browser. Use TRUE to allow email auto-discovery, if exactly one matching token is found in the cache. Specify just the domain with a glob pattern, e.g. "*@example.com", to create code that "just works" for both andrew@example.com and illah@example.com. Defaults to the option named "gargle_oauth_email", retrieved by "gargle_oauth_email()".

#' @param path JSON identifying the service account, in one of the forms supported for the "txt" argument of "jsonlite::fromJSON()" (typically, a file path or JSON string). 
 
#' @param scopes A character vector of scopes to request. Pick from those listed at: https://developers.google.com/identity/protocols/oauth2/scopes. For certain token flows, the "https://www.googleapis.com/auth/userinfo.email" scope is unconditionally included. This grants permission to retrieve the email address associated with a token; gargle uses this to index cached OAuth tokens. This grants no permission to view or send email and is generally considered a low-value scope.

#' @param cache Specifies the OAuth token cache. Defaults to the option named "gargle_oauth_cache", retrieved via "gargle_oauth_cache()".
 
#' @param use_oob Whether to prefer "out of band" authentication. Defaults to the option named "gargle_oob_default", retrieved via "gargle_oob_default()". 

#' @param token A token with class Token2.0 or an object of httr's class request, i.e. a token that has been prepared with "httr::config()" and has a Token2.0 in the auth_token component. 

#'Details
#'Most users, most of the time, do not need to call drive_auth() explicitly -- it is triggered by the first action that requires authorization. Even when called, the default arguments often suffice. However, when necessary, this function allows the user to explicitly:
#'-Declare which Google identity to use, via an email address. If there are multiple cached tokens, this can clarify which one to use. It can also force googledrive to switch from one identity to another. If there's no cached token for the email, this triggers a return to the browser to choose the identity and give consent. You can specify just the domain by using a glob pattern. This means that a script containing email = "*@example.com" can be run without further tweaks on the machine of either andrew@example.com or illah@example.com.
#'-Use a service account token or workload identity federation.
#'-Bring their own Token2.0.
#'-Specify non-default behavior re: token caching and out-of-bound authentication.
#'-Customize scopes.

#'For details on the many ways to find a token, see gargle::token_fetch(). For deeper control over auth, use drive_auth_configure() to bring your own OAuth app or API key. Read more about gargle options, see "gargle::gargle_options".

#' @keywords Google drive authentication
#' @export
#' @examples
#' \dontrun{
#' # load/refresh existing credentials, if available
#' # otherwise, go to browser for authentication and authorization
#' drive_auth()
#'
#' # see user associated with current token
#' drive_user()
#'
#' # force use of a token associated with a specific email
#' drive_auth(email = "illah@example.com")
#' drive_user()
#'
#' # force the OAuth web dance
#' drive_auth(email = NA)
#'
#' # use a 'read only' scope, so it's impossible to edit or delete files
#' drive_auth(
#'   scopes = "https://www.googleapis.com/auth/drive.readonly"
#' )
#'
#' # use a service account token
#' drive_auth(path = "foofy-83ee9e7c9c48.json")
#' }
#' 
#' google_account_authorization()

google_account_authorization <- function(email, path = NULL, scopes, cache, use_oob, token = NULL){
  googledrive::drive_auth(email, path, scopes, cache, use_oob, token)
}
  