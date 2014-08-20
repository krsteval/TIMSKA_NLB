using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public String Username{get;set;}
        public String Role {get;set;}
        public Int32 Id{get;set;}

	public User()
	{

        this.Id=0;
        this.Username="";
        this.Role="";
        
	}
}