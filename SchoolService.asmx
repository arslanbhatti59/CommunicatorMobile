<%@ WebService Language="C#" Class="SchoolService" %>

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class SchoolService  : System.Web.Services.WebService {

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    
    public string HelloWorld(string email, string password) {
        return "Hello World";
    }

    public ServiceAuthHeader CustomSoapHeader;
    string cnnString = ConfigurationManager.ConnectionStrings["DBSchoolCom"].ConnectionString.ToString();
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<SchoolUser> GetSchoolUserByEmailAndPassword(string email, string password)
    {
        try
        {
            List<SchoolUser> lstSchoolUser = new List<SchoolUser>();

            if (ServiceAuthHeaderValidation.Validate(CustomSoapHeader) == true)
            {
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_SchoolUsers", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 2;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = email;
                cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar)).Value = password;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = 0;
                cmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar)).Value = "";
                cmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar)).Value = "";
                cmd.Parameters.Add(new SqlParameter("@SchoolCode", SqlDbType.VarChar)).Value = "";
                cmd.Parameters.Add(new SqlParameter("@CreatedDate", SqlDbType.DateTime)).Value = DateTime.Now;
                cmd.Parameters.Add(new SqlParameter("@UpdatedDate", SqlDbType.DateTime)).Value = DateTime.Now;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        SchoolUser ObjSchoolUser = new SchoolUser();
                        ObjSchoolUser.SchoolUserId = Convert.ToInt32(rdr["SchoolUserId"]);
                        ObjSchoolUser.FirstName = Convert.ToString(rdr["FirstName"]);
                        ObjSchoolUser.LastName = Convert.ToString(rdr["LastName"]);
                        ObjSchoolUser.Email = Convert.ToString(rdr["Email"]);
                        ObjSchoolUser.Password = Convert.ToString(rdr["Password"]);
                        ObjSchoolUser.SchoolCode = Convert.ToString(rdr["SchoolCode"]);
                        ObjSchoolUser.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                        ObjSchoolUser.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);

                        lstSchoolUser.Add(ObjSchoolUser);
                    }
                }
                sqlConnection.Close();
                return lstSchoolUser.ToList();
            }
            else
            {
                return lstSchoolUser.ToList();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
}

public class SchoolUser
{
    public int SchoolUserId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public string SchoolCode { get; set; }
    public DateTime CreatedDate { get; set; }
    public DateTime UpdatedDate { get; set; }
    public string SchoolName { get; set; }
    public string SchoolLogo { get; set; }
}

public class ServiceAuthHeaderValidation
{
    /// <summary>
    /// Validates the credentials of the soap header.
    /// </summary>
    /// <returns></returns>
    public static bool Validate(ServiceAuthHeader soapHeader)
    {
        if (soapHeader == null)
        {
            return false;
            throw new NullReferenceException("No soap header was specified.");
        }
        if (soapHeader.Username == null)
        {
            return false;
            throw new NullReferenceException("Username was not supplied for authentication in SoapHeader.");
        }
        if (soapHeader.Password == null)
        {
            return false;
            throw new NullReferenceException("Password was not supplied for authentication in SoapHeader.");
        }

        if (soapHeader.Username != "Bilal123" || soapHeader.Password != "Bilal123")
        {
            return false;
            throw new Exception("Please pass the proper username and password for this service.");
        }
        return true;
    }
}

public class ServiceAuthHeader : SoapHeader
{
    public string Username;
    public string Password;
}