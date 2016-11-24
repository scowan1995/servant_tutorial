{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module ApiType where

import Data.Text
import Servant.API
--our endpoint will be accessible under "/users"
--
--THe endpoint ahas a query string parameter named sortby whose value will
--be of type SortBy
--
--Get '[JSON] [User] says that the endpoint will be accessible through HTTP
--GET requests, returning a list of users encoded as JSON
--the :> operator spearates the various "combinators" for a static path
type UserAPI = "users" :> QueryParam "sortby" SortBy :> Get '[JSON] [User]

type UserAPI3 = "users" :> "list-all" :> "now" :> Get '[JSON] [User]
              -- describes an endpoint reachable at:
              -- /users/list-all/now

data SortBy = Age | Name

data User = User {
    name :: String,
    age :: Int
}

