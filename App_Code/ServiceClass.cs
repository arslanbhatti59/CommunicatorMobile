using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ServiceClass
/// </summary>
public class ServiceClass
{
	public ServiceClass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public ServiceSchool.WebService SetServiceSoapHeader()
    {
        ServiceSchool.WebService objWebService=new ServiceSchool.WebService();
        ServiceSchool.ServiceAuthHeader objHeader = new ServiceSchool.ServiceAuthHeader();
        objHeader.Username = "Bilal123";
        objHeader.Password = "Bilal123";
        objWebService.ServiceAuthHeaderValue = objHeader;
       
        return objWebService;
         //objWebService.GetSchools_SchoolCodeWise("");
    }
}