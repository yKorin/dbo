CREATE OR REPLACE PACKAGE DEV IS
    FUNCTION get_developer_name (developer_name developer.dname%TYPE, developer_login developer.login%TYPE)
    RETURN VARCHAR2;
    PROCEDURE new_developer( status out VARCHAR2,
                            developer_name in developer.dname%TYPE,
                            developer_login in developer.login%TYPE,
                            developer_email in developer.email%TYPE,
                            developer_age in developer.age%TYPE);

    PROCEDURE delete_developer( status out VARCHAR2,
                                developer_login in developer.login%TYPE);
    PROCEDURE update_developer( status out VARCHAR2,
                            developer_name in developer.dname%TYPE,
                            developer_login in developer.login%TYPE,
                            developer_email in developer.email%TYPE,
                            developer_age in developer.age%TYPE);
end DEV;

create or replace PACKAGE BODY DEV is

    FUNCTION get_developer_name (developer_name developer.dname%TYPE, developer_login developer.login%TYPE)
    RETURN VARCHAR2 is
        return_name VARCHAR2(30);
    begin 
        select developer.dname into return_name
        from developer
        where trim(developer.login)=trim(developer_login);
    
        return return_name;
    end get_developer_name;
   
    PROCEDURE new_developer( status out VARCHAR2,
                            developer_name in developer.dname%TYPE,
                            developer_login in developer.login%TYPE,
                            developer_email in developer.email%TYPE,
                            developer_age in developer.age%TYPE) is
    begin 
        BEGIN
            insert into developer(developer.dname,developer.login,developer.email,developer.age) values (developer_name,developer_login,developer_email,developer_age);
             COMMIT;
                status:='ok';
        EXCEPTION 
            WHEN DUP_VAL_ON_INDEX THEN
                status:='user already exists';            
            WHEN OTHERS THEN 
                status:=SQLERRM;
        END;
    end new_developer;
    
    PROCEDURE delete_developer( status out VARCHAR2,
                                developer_login in developer.login%TYPE) is 
    begin
        BEGIN
            DELETE FROM developer where trim(developer.login)=trim(developer_login);
            COMMIT;
            status:='ok';
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN 
                status:='user does not exists';            
            WHEN OTHERS THEN 
                status:='\(-_-)/';
        END;
    end delete_developer;
    

      PROCEDURE update_developer( status out VARCHAR2,
                            developer_name in developer.dname%TYPE,
                            developer_login in developer.login%TYPE,
                            developer_email in developer.email%TYPE,
                            developer_age in developer.age%TYPE) is 
        begin 
            BEGIN
                                UPDATE developer SET age = developer_age, dname = developer_name, login = developer_login
                                where trim(developer.email)=trim(developer_email); 
                                COMMIT;
                status:='ok';
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN 
                    status:='user does not exists';            
                WHEN OTHERS THEN 
                    status:='\(-_-)/';
            END;
        end update_developer;

end DEV;
