+++
title = "Multi-tenancy in Dgraph Cloud"
weight = 6
[menu.main]
    parent = "cloud"
+++

Multi-Tenancy in Dgraph cloud is a dedicated cluster feature. It is not supported in free/shared clusters. Multi-tenancy is built upon Access Control Lists (ACL), and enables multiple tenants to share a Dgraph cluster using unique namespaces. The tenants are logically separated, and their data lies in the same p directory. Each namespace has a group guardian, which has root access to that namespace. [Read more about Multi-Tenancy in Dgraph]("https://dgraph.io/docs/enterprise-features/multitenancy/")

### Enabling Multi-Tenancy in Dgraph Cloud
In order to enable multi-Tenancy you need to do the following - 

1. **Enable ACL**
    - If you are launching a dedicated cluster for the first time, you need to click on the checkbox for ACLs under addition Settings.
    - For existing dedicated cluster, you need to go to Settings>Modify Backend and click on the checkbox for ACLs under addition Settings. Note - This restarts your backend hence causing some downtime. 
    ![ACL](/images/multitenancy/acl.png)

2. **Create namespaces**
    - Go to `Namespaces` page under `Admin` section on the sidebar to the left.
    - Click on `Create New` button, enter the description of the namespace and click `Create`.
    - You can view the created namespaces on the `Namespaces` page.
    - Tenant 0 cannot be deleted.
    ![namespacepage](/images/multitenancy/namespacepage.png)

3. **Toggle namespaces**
    - Now you should be able to see a select box next to selected backend select box on the navbar.
    - You can switch between namespaces with the selection.
    - Each namespace has its own Schema, ACLs & Lambdas. Also has its own view of Dgraph Studio, API Explorer, DQL Page.
    - After switching namespaces, you can update view/update the namespace's schema and query/mutate as well.
    ![namespaces](/images/multitenancy/namespaces.png)

4. **Accessing namespaces via client**
    - Namespaces are protected via ACLs. 
    - You need to create a user with username & password in the namespace. This can be done using `ACLs` page under `Admin` section on the sidebar to the left.


   **Example - we want to give all read access to a user for namespace**
    - First you should create an ACL group and select all the predicates you want to give read access
    ![group](/images/multitenancy/group.png)
    - Next, create a user with access to the created group. While creating the user, you will be asked to username & password. Keep it handy.
    ![user](/images/multitenancy/user.png)
    - You can go to API explorer and user the login mutation to fetch the API access token. Click on admin radio button at the top to query the admin endpoint. Use the below mutation to get the access token.
    (Note - NamespaceID can be found on the namespace page)
    ```
    mutation MyMutation {
        login(namespace: 1, password: "password", userId: "userID") {
            response {
                accessJWT
                refreshJWT
            }
        }
    }

    ```
    

    - You have the access token which you need to pass it in `X-Dgraph-AccessToken` header.
    - On client side you will need to use the above mutation programatically to generate the access token for your namespace. 
    - If you are using a dgraph client you need to set the username password and the client handles fetching the token & refresh logic for you.

    

