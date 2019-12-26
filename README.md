# MatriculaWeb
MatriculaWeb - Sec Edu DF


# Scaffolds:

1. School:
    ```shellscript
      $ rails g scaffold School name:string code:string user:belongs_to
    ```
1. Subject (workload = total time of it subject):
    ```shellscript
      $ rails g scaffold Subject name:string description:string workload:integer online_link:string class_schedule:string user:belongs_to
    ```
1. Subscription:
    ```shellscript
      $ rails g scaffold Subscription access_type:string user:belongs_to subject:belongs_to 
    ```


Clear Database: ``` $ rails d scaffold School && rails d scaffold Subject && rails d scaffold Subscription ```
*Remember to update add_school_ref_to_user migration timestamp