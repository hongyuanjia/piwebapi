tableApi <- R6Class("tableApi",
	private = list(),
	public = list(
		serviceBase = NULL,
		authType = NULL,
		username = NULL,
		password = NULL,
		validateSSL = NULL,
		debug = NULL,
		initialize = function(baseUrl, authType, username, password, validateSSL, debug) {
			self$serviceBase <- baseUrl
			self$username <- username
			self$password <- password
			self$authType <- authType
			self$validateSSL <- validateSSL
			self$debug <- debug
		},
		getByPath = function(path, selectedFields) {
			queryParameters <- list()
			if (is.null(path) || path == "") {
				return (paste0("Error: required parameter path was null or undefined"))
			}
			if (is.character(path) == FALSE) {
				return (print(paste0("Error: path must be a string.")))
			}
			queryParameters$path <- path
			localVarPath <- paste(c(self$serviceBase, '/tables'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "PITable"
			}
			return (contentResponse)
		},
		get = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "PITable"
			}
			return (contentResponse)
		},
		update = function(webId, PITable) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(PITable) || PITable == "") {
				return (paste0("Error: required parameter PITable was null or undefined"))
			}
			className <- attr(PITable, "className")
			if ((is.null(className)) || (className != "PITable")) {
				return (print(paste0("Error: the class from the parameter PITable should be PITable.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId), collapse = "")
			res <- patchHttpRequest(localVarPath, PITable, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		delete = function(webId) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId), collapse = "")
			res <- deleteHttpRequest(localVarPath, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		getCategories = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId, '/categories'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "PIItemsTableCategory"
			}
			return (contentResponse)
		},
		getData = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId, '/data'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
			}
			return (contentResponse)
		},
		updateData = function(webId, PITableData) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(PITableData) || PITableData == "") {
				return (paste0("Error: required parameter PITableData was null or undefined"))
			}
			className <- attr(PITableData, "className")
			if ((is.null(className)) || (className != "PITableData")) {
				return (print(paste0("Error: the class from the parameter PITableData should be PITableData.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId, '/data'), collapse = "")
			res <- putHttpRequest(localVarPath, queryParameters, PITableData, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		getSecurity = function(webId, userIdentity, forceRefresh, selectedFields) {
			queryParameters <- generateListForQueryString(userIdentity, "userIdentity")
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(userIdentity) || userIdentity == "") {
				return (paste0("Error: required parameter userIdentity was null or undefined"))
			}
			if (is.vector(userIdentity) == FALSE) {
				return (print(paste0("Error: userIdentity must be a vector.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId, '/security'), collapse = "")
			if (missing(forceRefresh) == FALSE && is.null(forceRefresh) == FALSE && forceRefresh != "") {
				queryParameters$forceRefresh <- forceRefresh
				if (is.logical(forceRefresh) == FALSE) {
					return (print(paste0("Error: forceRefresh must be a boolean.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "PIItemsSecurityRights"
			}
			if (res$status == 400) {
				attr(contentResponse, "className") <- "PIErrors"
			}
			if (res$status == 401) {
				attr(contentResponse, "className") <- "PIErrors"
			}
			if (res$status == 409) {
				attr(contentResponse, "className") <- "PIErrors"
			}
			if (res$status == 502) {
				attr(contentResponse, "className") <- "PIErrors"
			}
			return (contentResponse)
		},
		getSecurityEntries = function(webId, nameFilter, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId, '/securityentries'), collapse = "")
			if (missing(nameFilter) == FALSE && is.null(nameFilter) == FALSE && nameFilter != "") {
				queryParameters$nameFilter <- nameFilter
				if (is.character(nameFilter) == FALSE) {
					return (print(paste0("Error: nameFilter must be a string.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "PIItemsSecurityEntry"
			}
			return (contentResponse)
		},
		createSecurityEntry = function(webId, PISecurityEntry, applyToChildren) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(PISecurityEntry) || PISecurityEntry == "") {
				return (paste0("Error: required parameter PISecurityEntry was null or undefined"))
			}
			className <- attr(PISecurityEntry, "className")
			if ((is.null(className)) || (className != "PISecurityEntry")) {
				return (print(paste0("Error: the class from the parameter PISecurityEntry should be PISecurityEntry.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId, '/securityentries'), collapse = "")
			if (missing(applyToChildren) == FALSE && is.null(applyToChildren) == FALSE && applyToChildren != "") {
				queryParameters$applyToChildren <- applyToChildren
				if (is.logical(applyToChildren) == FALSE) {
					return (print(paste0("Error: applyToChildren must be a boolean.")))
				}
			}
			res <- postHttpRequest(localVarPath, PISecurityEntry, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		getSecurityEntryByName = function(name, webId, selectedFields) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId, '/securityentries/', name), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "PISecurityEntry"
			}
			if (res$status == 404) {
				attr(contentResponse, "className") <- "PIErrors"
			}
			return (contentResponse)
		},
		updateSecurityEntry = function(name, webId, PISecurityEntry, applyToChildren) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(PISecurityEntry) || PISecurityEntry == "") {
				return (paste0("Error: required parameter PISecurityEntry was null or undefined"))
			}
			className <- attr(PISecurityEntry, "className")
			if ((is.null(className)) || (className != "PISecurityEntry")) {
				return (print(paste0("Error: the class from the parameter PISecurityEntry should be PISecurityEntry.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId, '/securityentries/', name), collapse = "")
			if (missing(applyToChildren) == FALSE && is.null(applyToChildren) == FALSE && applyToChildren != "") {
				queryParameters$applyToChildren <- applyToChildren
				if (is.logical(applyToChildren) == FALSE) {
					return (print(paste0("Error: applyToChildren must be a boolean.")))
				}
			}
			res <- putHttpRequest(localVarPath, queryParameters, PISecurityEntry, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		deleteSecurityEntry = function(name, webId, applyToChildren) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/tables/', webId, '/securityentries/', name), collapse = "")
			if (missing(applyToChildren) == FALSE && is.null(applyToChildren) == FALSE && applyToChildren != "") {
				queryParameters$applyToChildren <- applyToChildren
				if (is.logical(applyToChildren) == FALSE) {
					return (print(paste0("Error: applyToChildren must be a boolean.")))
				}
			}
			res <- deleteHttpRequest(localVarPath, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		}
	)
)