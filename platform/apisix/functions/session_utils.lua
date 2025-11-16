local _M = {}

function _M.has_bearer_token()
    local authorization = ngx.req.get_headers()["Authorization"]
    return authorization and authorization:match("^Bearer%s+")
end

function _M.inject_session_token_as_bearer(session_secret)
    local ok, session_lib = pcall(require, "resty.session")
    if not ok then
        ngx.log(ngx.ERR, "Could not load resty.session: ", session_lib)
        return false
    end

    local session = session_lib.new({
        secret = session_secret
    })
    local ok, err = session:open()
    if not ok then
        ngx.log(ngx.ERR, "Failed to open session: ", err or "unknown error")
        return false
    end

    if session.present and session.data and session.data.access_token then
        ngx.req.set_header("Authorization", "Bearer " .. session.data.access_token)
        ngx.log(ngx.INFO, "Injected Authorization header from session")
        return true
    else
        ngx.log(ngx.WARN, "No session token found to inject (present=", tostring(session.present), ")")
        return false
    end
end

return _M