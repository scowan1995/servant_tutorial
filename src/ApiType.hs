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

--an endpoint will alwasy end with a Verb combinator
type UserAPI4 = "users" :> Get '[JSON] [User]
           :<|> "admins" :> Get '[JSON] [User]

type UserAPI5 = "user" :> Capture "userid" Integer :> Get '[JSON] User
 -- equivalent to 'GET /user/:userid'
-- except that we explicitly say that "userid" must be an integer
-- bascially Capture (urlsegment name) (url segment type)

--here [*] means a list of types
data Verb method (statusCode :: Nat) (contentType :: [*]) a
type Get = Verb 'GET 200
data SortBy = Age | Name

data User = User {
    name :: String,
    age :: Int
}

