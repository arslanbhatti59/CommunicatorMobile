<%@ WebService Language="C#" CodeBehind="~/App_Code/WebService.cs" Class="WebService" %>

using System.Web.Services.Protocols;
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]


public class WebService : System.Web.Services.WebService
{
    string cnnString = ConfigurationManager.ConnectionStrings["DBSchoolCom"].ConnectionString.ToString();

    //const string cnnString = "Data Source=174.36.143.62; Initial Catalog=Communicator; User ID=admin123; password=admin123;";

    public WebService()
    {
    }

    private static byte[] key = { };
    private static byte[] IV = { 38, 55, 206, 48, 28, 64, 20, 16 };
    private static string stringKey = "019203T&H";
    
    
    public class ServiceAuthHeader : SoapHeader
    {
        public string Username;
        public string Password;
    }
    
    public ServiceAuthHeader CustomSoapHeader;
    
    [WebMethod]
    public void AuthenticateSoapHeader()
    {

        ServiceClass objServiceClass = new ServiceClass();
        objServiceClass.SetServiceSoapHeader();
        
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


    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public string HelloWorld()
    {
         
        return "Hello World !";
        
    }

    public class Share
    {
        public int ShareId { get; set; }
        public string MyName { get; set; }
        public string MyEmail { get; set; }
        public string FriendName { get; set; }
        public string FriendEmail { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class News
    {
        public int NewsId { get; set; }
        public int SchoolId { get; set; }
        public int ChannelId { get; set; }
        public string ChannelName { get; set; }
        public string NewsHeading { get; set; }
        public string NewsDescription { get; set; }
        public string NewsStatus { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public string CreatedBy { get; set; }
    }

    public class Contact
    {
        public int ContactId { get; set; }
        public int SchoolId { get; set; }
        public string StaffName { get; set; }
        public string Address { get; set; }
        public string PhoneNo { get; set; }
        public string EmailAddress { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public string Designation { get; set; }
    }

    public class Language
    {
        public int LanguageId { get; set; }
        public int SchoolId { get; set; }
        public string LanguageTitle { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class Personalise
    {
        public int PersonaliseId { get; set; }
        public int ChannelId { get; set; }
        public int LanguageId { get; set; }
        public int SchoolId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class UserType
    {
        public int UserTypeId { get; set; }
        public string UserTypeName { get; set; }
    }

    public class Channel
    {
        public int ChannelId { get; set; }
        public int SchoolId { get; set; }
        public string ChannelName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public bool IsActive { get; set; }
    }

    public class Calendar
    {
        public int CalendarId { get; set; }
        public int ChannelId { get; set; }
        public int SchoolId { get; set; }
        public string CalendarEventTitle { get; set; }
        public string CalendarEventDescription { get; set; }
        public DateTime EventStartDate { get; set; }
        public DateTime EventEndDate { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public string EventImage { get; set; }
        public string ChannelName { get; set; }
    }

    public class Child
    {
        public int ChildId { get; set; }
        public int ChannelId { get; set; }
        public int SchoolId { get; set; }
        public int ChildofUserId { get; set; }
        public string ChildFirstName { get; set; }
        public string ChildLastName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class Gallery
    {
        public int GalleryId { get; set; }
        public int SchoolId { get; set; }
        public int GalleryTypeId { get; set; }
        public string GalleryFilePath { get; set; }
        public string GalleryFileName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class GalleryType
    {
        public int GalleryTypeId { get; set; }
        public int SchoolId { get; set; }
        public string GalleryTypeName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class Resources
    {
        public int ResourcesId { get; set; }
        public int SchoolId { get; set; }
        public int ChannelId { get; set; }
        public int ResourcesTypeId { get; set; }
        public string ResourcesTitle { get; set; }
        public string ResourcesDescription { get; set; }
        public DateTime ResourceDate { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class ResourcesType
    {
        public int ResourcesTypeId { get; set; }
        public int SchoolId { get; set; }
        public int ChannelId { get; set; }
        public string ResourceTypeTitle { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class Class
    {
        public int ClassId { get; set; }
        public string ClassTitle { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public int SchoolId { get; set; }
    }

    public class User
    {
        public int UserId { get; set; }
        public int UserTypeId { get; set; }
        public string UserFristName { get; set; }
        public string UserLastName { get; set; }
        public string UserEmail { get; set; }
        public string UserAddress1 { get; set; }
        public string UserAddress2 { get; set; }
        public string UserGender { get; set; }
        public string UserPassword { get; set; }
        public string UserPhoneNo { get; set; }
        public string UserGuid { get; set; }
        public string UserCode { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        //added by khalid 20-03-13
        public int SchoolId { get; set; }
    }

    public class CurrentNews
    {
        public int CurrentNewsId { get; set; }
        public string CurrentNewsDetail { get; set; }
        public bool CurrentNewsEnable { get; set; }
        public int SchoolId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class School
    {
        public int SchoolId { get; set; }
        public string SchoolName { get; set; }
        public string SchoolPassword { get; set; }
        public string SchoolEmail { get; set; }
        public string SchoolAddress { get; set; }
        public string SchoolLogo { get; set; }
        public string SchoolPhoneNumber { get; set; }
        public string SchoolGuid { get; set; }
        public string SchoolCode { get; set; }
        public bool AccountAcitve { get; set; }
        public string SecretQuestion { get; set; }
        public string SecretAnswer { get; set; }
        public int BusinessTypeId { get; set; }
        public string FormBackColor { get; set; }
        public string TabFocusedBackColor { get; set; }
        public string TabFocusedForeColor { get; set; }
        public string TabNonFocusedBackColor { get; set; }
        public string TabNonFocusedForeColor { get; set; }
        public string BusinessTypeTitle { get; set; }
    }

    public class Menu
    {
        public int MenuId { get; set; }
        public string MenuText { get; set; }
        public int SchoolId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public string PageName { get; set; }
    }

    public class ShowPages
    {
        public int ShowPagesId { get; set; }
        public string PageName { get; set; }
        public int SchoolId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public bool NewPage { get; set; }
        public string TabPageText { get; set; }
    }

    public class RSS
    {
        public int RSSId { get; set; }
        public string RSSURL { get; set; }
        public int SchoolId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }

    public class Teacher
    {
        public int TeacherId { get; set; }
        public string TeacherName { get; set; }
        public string TeacherEmail { get; set; }
        public string TeacherNo { get; set; }
        public string TeacherAddress { get; set; }
        public string TeacherPassword { get; set; }
        public int ClassId { get; set; }
        public int SchoolId { get; set; }
        public int GuId { get; set; }
        public bool Varified { get; set; }
        public string FaxNo { get; set; }
    }

    public class Messages
    {
        public int MessageID{ get; set; }
        public int  ParentID{ get; set; }
        public int TeacherID{ get; set; }
        public int StudentID{ get; set; }
        public string TeacherName { get; set; }
        public string ParentName { get; set; }
        public string  ParentMessage{ get; set; }
        public string  ParentReply{ get; set; }
        public string  TeacherMessage{ get; set; }
        public string  TeacherReply{ get; set; }
        public string  Sender{ get; set; }
        public string  Receiver{ get; set; }
        public DateTime SendMessageDate{ get; set; }
        public DateTime ReplyMessageDate{ get; set; }
        public string Deleted{ get; set; }
        public int ClassId { get; set; }
    }


    public class Parents
    {
        public int ParentId { get; set; }
        public string ParentName { get; set; }
        public string ParentPassword { get; set; }
        public string ParentEmail { get; set; }
        public string ParentPhoneNo { get; set; }
        public string ParentGuid { get; set; }
        public string ParentCode { get; set; }
        public bool AccountAcitve { get; set; }
        public string ParentAddress { get; set; }
        public int SchoolId { get; set; }
        public int ClassId { get; set; }
        public int StudentId { get; set; }
    }

    public class Student
    {
        public int StudentId { get; set; }
        public string StudentFirstName { get; set; }
        public string StudentLastName { get; set; }
        public string StudentNo { get; set; }
        public string StudentAddress { get; set; }
        public string StudentEmail { get; set; }
        public int SchoolId { get; set; }
        public int ParentId { get; set; }
        public int ClassId { get; set; }
    }

    public class Forum
    {
        public int ForumId { get; set; }
        public int StudentId { get; set; }
        public int ClassId { get; set; }
        public int SchoolId { get; set; }
        public string Subject { get; set; }
        public string Description { get; set; }
        public string Comments { get; set; }
        public string StudentFullName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public int FID { get; set; }
    }
    
    public class Status
    {
        public int StatusMessage { get; set; }
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
    }

    public class UserChannels
    {
        public int UserChannelID { get; set; }
        public int SchoolUserId { get; set; }
        public int ChannelId { get; set; }
        public string Email { get; set; }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<School> GetAllSchoolsBySchoolUserEmail(string email)
    {
        try
        {
            List<School> lstSchool = new List<School>();

             
            SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_SchoolUsers", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 10;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = email;
                cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar)).Value = "";
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
                        School ObjSchool = new School();
                        ObjSchool.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                        ObjSchool.SchoolName = Convert.ToString(rdr["SchoolName"]);
                        ObjSchool.SchoolLogo = Convert.ToString(rdr["SchoolLogo"]);
                        ObjSchool.SchoolCode = Convert.ToString(rdr["SchoolCode"]);
                        

                        lstSchool.Add(ObjSchool);
                    }
                }
                sqlConnection.Close();
                return lstSchool.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    
    // added by Khalid 18-3-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<School> GetSchoolByBusinessAdminEmail(string email)
    {
        try
        {
            List<School> lstSchool = new List<School>();

             
             SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_School", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 19;
                cmd.Parameters.Add(new SqlParameter("@SchoolEmail", SqlDbType.VarChar)).Value = email;
                cmd.Parameters.Add(new SqlParameter("@SchoolPassword", SqlDbType.VarChar)).Value = "";
                //cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = 0;
                //cmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar)).Value = "";
                //cmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar)).Value = "";
                //cmd.Parameters.Add(new SqlParameter("@SchoolCode", SqlDbType.VarChar)).Value = "";
                //cmd.Parameters.Add(new SqlParameter("@CreatedDate", SqlDbType.DateTime)).Value = DateTime.Now;
                //cmd.Parameters.Add(new SqlParameter("@UpdatedDate", SqlDbType.DateTime)).Value = DateTime.Now;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        School ObjSchool = new School();
                        ObjSchool.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                        ObjSchool.SchoolName = Convert.ToString(rdr["SchoolName"]);
                        ObjSchool.SchoolLogo = Convert.ToString(rdr["SchoolLogo"]);
                        ObjSchool.SchoolCode = Convert.ToString(rdr["SchoolCode"]);


                        lstSchool.Add(ObjSchool);
                    }
                }
                sqlConnection.Close();
                return lstSchool.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public void InsertUserChannel(int schoolUserId, int channelId)
    {
        try
        {


             
            SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_UserChannels", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 2;
                cmd.Parameters.Add(new SqlParameter("@UserChannelID", SqlDbType.Int)).Value = 0;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = schoolUserId;
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = channelId;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = "";
                
                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                sqlConnection.Close();

           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //commented by khalid 10-1-13
    //uncommented by khalid 15-1-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<UserChannels> GetUserChannelsByEmailAndChannelID(string email, int channelId)
    {
        try
        {
            List<UserChannels> lstUserChannels = new List<UserChannels>();

             
              SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_UserChannels", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 1;
                cmd.Parameters.Add(new SqlParameter("@UserChannelID", SqlDbType.Int)).Value = 0;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = 0;
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = channelId;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = email;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        UserChannels ObjUserChannels = new UserChannels();
                        ObjUserChannels.UserChannelID = Convert.ToInt32(rdr["UserChannelID"]);
                        ObjUserChannels.SchoolUserId = Convert.ToInt32(rdr["SchoolUserId"]);
                        ObjUserChannels.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                        ObjUserChannels.Email = Convert.ToString(rdr["Email"]);


                        lstUserChannels.Add(ObjUserChannels);
                    }
                }
                sqlConnection.Close();
                return lstUserChannels.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    
    //added by khalid 11-1-13
    //updated by khalid 15-1-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<UserChannels> GetUserChannelsByEmailSchoolUserIdAndChannelID(string email, int channelId, int intSchoolUserId)
    {
        try
        {
            List<UserChannels> lstUserChannels = new List<UserChannels>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_UserChannels", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 6;
                cmd.Parameters.Add(new SqlParameter("@UserChannelID", SqlDbType.Int)).Value = 0;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = intSchoolUserId;
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = channelId;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = email;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        UserChannels ObjUserChannels = new UserChannels();
                        ObjUserChannels.UserChannelID = Convert.ToInt32(rdr["UserChannelID"]);
                        ObjUserChannels.SchoolUserId = Convert.ToInt32(rdr["SchoolUserId"]);
                        ObjUserChannels.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                        ObjUserChannels.Email = Convert.ToString(rdr["Email"]);


                        lstUserChannels.Add(ObjUserChannels);
                    }
                }
                sqlConnection.Close();
                return lstUserChannels.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
   
        

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Status> DeletetUserChannelBySchoolUserId(int schoolUserId)
    {
        try
        {

            List<Status> listStatus = new List<Status>();
             
            
                Status objStatus=new Status();
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_UserChannels", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 3;
                cmd.Parameters.Add(new SqlParameter("@UserChannelID", SqlDbType.Int)).Value = 0;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = schoolUserId;
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = 0;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = "";

                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                objStatus.StatusMessage = 1;
                listStatus.Add(objStatus);
                sqlConnection.Close();
                return listStatus;

            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<UserChannels> GetUserChannelsBySchoolUserIDAndChannelID(int schoolUserId, int channelId)
    {
        try
        {
            List<UserChannels> lstUserChannels = new List<UserChannels>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_UserChannels", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 4;
                cmd.Parameters.Add(new SqlParameter("@UserChannelID", SqlDbType.Int)).Value = 0;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = schoolUserId;
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = channelId;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = "";
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        UserChannels ObjUserChannels = new UserChannels();
                        ObjUserChannels.UserChannelID = Convert.ToInt32(rdr["UserChannelID"]);
                        ObjUserChannels.SchoolUserId = Convert.ToInt32(rdr["SchoolUserId"]);
                        ObjUserChannels.ChannelId = Convert.ToInt32(rdr["ChannelId"]);


                        lstUserChannels.Add(ObjUserChannels);
                    }
                }
                sqlConnection.Close();
                return lstUserChannels.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //commented by khalid 15-1-13
    //[WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    //public void InsertSchoolUser(int schoolUserId, string firstName, string lastName, string email, string password, string SchoolCode)
    //{
    //    try
    //    {


    //         
    //        {
    //            SqlConnection sqlConnection = new SqlConnection(cnnString);
    //            SqlCommand cmd = new SqlCommand("sp_SchoolUsers", sqlConnection) { CommandType = CommandType.StoredProcedure };
    //            cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
    //            cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = schoolUserId;
    //            cmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar)).Value = firstName;
    //            cmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar)).Value = lastName;
    //            cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = email;
    //            cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar)).Value = password;
    //            cmd.Parameters.Add(new SqlParameter("@SchoolCode", SqlDbType.VarChar)).Value = SchoolCode;
    //            cmd.Parameters.Add(new SqlParameter("@CreatedDate", SqlDbType.DateTime)).Value = DateTime.Now;
    //            cmd.Parameters.Add(new SqlParameter("@UpdatedDate", SqlDbType.DateTime)).Value = DateTime.Now;
    //            sqlConnection.Open();
    //            cmd.ExecuteNonQuery();
    //            sqlConnection.Close();

    //        }
    //        else
    //        {

    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}
    
    // added by khalid 15-1-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public void InsertSchoolUser(int schoolUserId, string firstName, string lastName, string email, string password, string SchoolCode, bool isActive)
    {
        try
        {


             
             SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_SchoolUsers", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = schoolUserId;
                cmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar)).Value = firstName;
                cmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar)).Value = lastName;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = email;
                cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar)).Value = password;
                cmd.Parameters.Add(new SqlParameter("@SchoolCode", SqlDbType.VarChar)).Value = SchoolCode;
                cmd.Parameters.Add(new SqlParameter("@CreatedDate", SqlDbType.DateTime)).Value = DateTime.Now;
                cmd.Parameters.Add(new SqlParameter("@UpdatedDate", SqlDbType.DateTime)).Value = DateTime.Now;
                cmd.Parameters.Add(new SqlParameter("@IsActive", SqlDbType.TinyInt)).Value = isActive;
                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                sqlConnection.Close();

            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //Added By Rizwan 22/1/2013
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public void Insert_SchoolUser(int opid, string firstName, string lastName, string email, string phone, string address, string SchoolCode, bool IsActive)
    {
        try
        {


             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_SchoolUsers", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = opid;
                cmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar)).Value = firstName;
                cmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar)).Value = lastName;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = email;
                cmd.Parameters.Add(new SqlParameter("@SchoolCode", SqlDbType.VarChar)).Value = SchoolCode;
                cmd.Parameters.Add(new SqlParameter("@Phone", SqlDbType.VarChar)).Value = phone;
                cmd.Parameters.Add(new SqlParameter("@Address", SqlDbType.VarChar)).Value = address;
                cmd.Parameters.Add(new SqlParameter("@IsActive", SqlDbType.TinyInt)).Value = IsActive;


                sqlConnection.Open();
                cmd.ExecuteNonQuery();

                sqlConnection.Close();

            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    //Web methode is added by Rizwan 27/1/2013
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<SchoolUser> GetSchoolUser_EmailAndSchoolCode(string email, string code)
    {
        try
        {
            List<SchoolUser> lstSchoolUser = new List<SchoolUser>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_SchoolUsers", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 8;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = email;
                cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar)).Value = "";
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = 0;
                cmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar)).Value = "";
                cmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar)).Value = "";
                cmd.Parameters.Add(new SqlParameter("@SchoolCode", SqlDbType.VarChar)).Value = code;
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
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<SchoolUser> MobileAppGetSchoolUserByEmailAndPassword(string email, string password)
    {
        try
        {
            string EncryptedPassword = Encrypt(password);
            List<SchoolUser> lstSchoolUser = GetSchoolUserByEmailAndPassword(email, EncryptedPassword).ToList();
            return lstSchoolUser;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<SchoolUser> GetSchoolUserByEmailAndPassword(string email, string password)
    {
        try
        {
            List<SchoolUser> lstSchoolUser = new List<SchoolUser>();

             
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
        catch (Exception ex)
        {
            throw ex;
        }
    }

    
   // added by khalid 14-3-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<School> GetSchoolByEmailPassword(string email, string password)
    {
        try
        {
            List<School> lstSchool = new List<School>();
             
            SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_School", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 18;
                cmd.Parameters.Add(new SqlParameter("@SchoolEmail", SqlDbType.VarChar)).Value = email;
                cmd.Parameters.Add(new SqlParameter("@SchoolPassword", SqlDbType.VarChar)).Value = password;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        School ObjSchool = new School();
                        ObjSchool.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                        ObjSchool.SchoolName = Convert.ToString(rdr["SchoolName"]);
                        ObjSchool.SchoolLogo = Convert.ToString(rdr["SchoolLogo"]);
                        ObjSchool.SchoolCode = Convert.ToString(rdr["SchoolCode"]);
                        lstSchool.Add(ObjSchool);
                    }
                }
                sqlConnection.Close();
                return lstSchool.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<SchoolUser> GetSchoolUserByEmail(string email)
    {
        try
        {
            List<SchoolUser> lstSchoolUser = new List<SchoolUser>();

             
            SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_SchoolUsers", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = email;
                cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar)).Value = "";
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
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public void InsertParent(string parentName, string parentPassword, string parentEmail, string parentPhoneNo, string parentGuid, string parentCode, bool accountAcitve, string parentAddress, int schoolId)
    {
        try
        {
            

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Parent", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 2;
                cmd.Parameters.Add(new SqlParameter("@ParentName", SqlDbType.VarChar)).Value = parentName;
                cmd.Parameters.Add(new SqlParameter("@ParentPassword", SqlDbType.VarChar)).Value = parentPassword;
                cmd.Parameters.Add(new SqlParameter("@ParentEmail", SqlDbType.VarChar)).Value = parentEmail;
                cmd.Parameters.Add(new SqlParameter("@ParentPhoneNo", SqlDbType.VarChar)).Value = parentPhoneNo;
                cmd.Parameters.Add(new SqlParameter("@ParentGuid", SqlDbType.VarChar)).Value = parentGuid;
                cmd.Parameters.Add(new SqlParameter("@ParentCode", SqlDbType.VarChar)).Value = parentCode;
                cmd.Parameters.Add(new SqlParameter("@AccountAcitve", SqlDbType.Bit)).Value = accountAcitve;
                cmd.Parameters.Add(new SqlParameter("@ParentAddress", SqlDbType.VarChar)).Value = parentAddress;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = schoolId;
                
                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                sqlConnection.Close();
                
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Parents> GetParentByEmail(string parentEmail)
    {
        try
        {
            List<Parents> lstParent = new List<Parents>();

             
           SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Parent", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 7;
                cmd.Parameters.Add(new SqlParameter("@ParentEmail", SqlDbType.VarChar)).Value = parentEmail;

                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        Parents ObjParent = new Parents();
                        ObjParent.ParentId = Convert.ToInt32(rdr["ParentId"]);
                        ObjParent.ParentName = Convert.ToString(rdr["ParentName"]);
                        ObjParent.ParentPassword = Convert.ToString(rdr["ParentPassword"]);
                        ObjParent.ParentEmail = Convert.ToString(rdr["ParentEmail"]);
                        ObjParent.ParentPhoneNo = Convert.ToString(rdr["ParentPhoneNo"]);
                        ObjParent.ParentGuid = Convert.ToString(rdr["ParentGuid"]);
                        ObjParent.ParentCode = Convert.ToString(rdr["ParentCode"]);
                        ObjParent.AccountAcitve = Convert.ToBoolean(rdr["AccountAcitve"]);
                        ObjParent.ParentAddress = Convert.ToString(rdr["ParentAddress"]);
                        ObjParent.SchoolId = Convert.ToInt32(rdr["SchoolId"]);

                        lstParent.Add(ObjParent);
                    }
                }
                sqlConnection.Close();
                return lstParent.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<RSS> GetRSS_SchoolIdWise(int SchoolId)
    {
        try
        {
            List<RSS> lstSchool = new List<RSS>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_RSS", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 7;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;

                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        RSS ObjSchool = new RSS();
                        ObjSchool.RSSId = Convert.ToInt32(rdr["RSSId"]);
                        ObjSchool.RSSURL = Convert.ToString(rdr["RSSURL"]);
                        ObjSchool.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                        ObjSchool.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                        if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                        {
                            ObjSchool.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                        }
                        lstSchool.Add(ObjSchool);
                    }
                }
                sqlConnection.Close();
                return lstSchool.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<ShowPages> GetShowPages_SchoolIdWise(int SchoolId, bool NewPage)
    {
        try
        {
            List<ShowPages> lstSchool = new List<ShowPages>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_ShowPages", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@NewPage", SqlDbType.Bit)).Value = NewPage;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        ShowPages ObjSchool = new ShowPages();
                        ObjSchool.ShowPagesId = Convert.ToInt32(rdr["ShowPagesId"]);
                        ObjSchool.PageName = Convert.ToString(rdr["PageName"]);
                        ObjSchool.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                        ObjSchool.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                        if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                        {
                            ObjSchool.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                        }
                        ObjSchool.NewPage = Convert.ToBoolean(rdr["NewPage"]);
                        ObjSchool.TabPageText = Convert.ToString(rdr["TabPageText"]);
                        lstSchool.Add(ObjSchool);
                    }
                }
                sqlConnection.Close();
                return lstSchool.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    public School GetSchool_SchoolIdWise(int SchoolId)
    {
        try
        {
            School ObjUser = new School();
            // 
            //{
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_School", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();

                if (rdr.HasRows == true)
                {
                    ObjUser.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjUser.SchoolName = Convert.ToString(rdr["SchoolName"]);
                    ObjUser.SchoolPassword = Convert.ToString(rdr["SchoolPassword"]);
                    ObjUser.SchoolEmail = Convert.ToString(rdr["SchoolEmail"]);
                    ObjUser.SchoolAddress = Convert.ToString(rdr["SchoolAddress"]);
                    ObjUser.SchoolLogo = Convert.ToString(rdr["SchoolLogo"]);
                    ObjUser.SchoolPhoneNumber = Convert.ToString(rdr["SchoolPhoneNumber"]);
                    ObjUser.SchoolGuid = Convert.ToString(rdr["SchoolGuid"]);
                    ObjUser.SchoolCode = Convert.ToString(rdr["SchoolCode"]);
                    ObjUser.AccountAcitve = Convert.ToBoolean(rdr["AccountAcitve"]);
                    ObjUser.SecretQuestion = Convert.ToString(rdr["SecretQuestion"]);
                    ObjUser.SecretAnswer = Convert.ToString(rdr["SecretAnswer"]);
                    ObjUser.BusinessTypeId = Convert.ToInt32(rdr["BusinessTypeId"]);
                    ObjUser.FormBackColor = Convert.ToString(rdr["FormBackColor"]);
                    ObjUser.TabFocusedBackColor = Convert.ToString(rdr["TabFocusedBackColor"]);
                    ObjUser.TabFocusedForeColor = Convert.ToString(rdr["TabFocusedForeColor"]);
                    ObjUser.TabNonFocusedBackColor = Convert.ToString(rdr["TabNonFocusedBackColor"]);
                    ObjUser.TabNonFocusedForeColor = Convert.ToString(rdr["TabNonFocusedForeColor"]);
                }
                sqlConnection.Close();
                return ObjUser;
            //}
            //else
            //{
            //    return ObjUser;
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    public string GetCurrentNews_SchoolIdWise(int SchoolId)
    {
        try
        {
            // 
            //{
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_CurrentNews", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 7;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                if (rdr.HasRows == true)
                {
                    CurrentNews ObjCurrentNews = new CurrentNews();
                    ObjCurrentNews.CurrentNewsId = Convert.ToInt32(rdr["CurrentNewsId"]);
                    ObjCurrentNews.CurrentNewsDetail = Convert.ToString(rdr["CurrentNewsDetail"]);
                    ObjCurrentNews.CurrentNewsEnable = Convert.ToBoolean(rdr["CurrentNewsEnable"]);
                    ObjCurrentNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCurrentNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);

                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCurrentNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }

                    sqlConnection.Close();

                    return ObjCurrentNews.CurrentNewsDetail;
                }
                else
                {
                    return "";
                }
            //}
            //else
            //{
            //    return "";
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public School GetSchools_SchoolCodeWise(string strSchoolCode)
    {
        try
        {
            School ObjSchool = new School();
             
            SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_School", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 14;
                cmd.Parameters.Add(new SqlParameter("@SchoolCode", SqlDbType.VarChar)).Value = strSchoolCode;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    ObjSchool.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjSchool.SchoolName = Convert.ToString(rdr["SchoolName"]);
                    ObjSchool.SchoolPassword = Convert.ToString(rdr["SchoolPassword"]);
                    ObjSchool.SchoolEmail = Convert.ToString(rdr["SchoolEmail"]);
                    ObjSchool.SchoolAddress = Convert.ToString(rdr["SchoolAddress"]);
                    ObjSchool.SchoolLogo = Convert.ToString(rdr["SchoolLogo"]);
                    ObjSchool.SchoolPhoneNumber = Convert.ToString(rdr["SchoolPhoneNumber"]);
                    ObjSchool.SchoolGuid = Convert.ToString(rdr["SchoolGuid"]);
                    ObjSchool.SchoolCode = Convert.ToString(rdr["SchoolCode"]);
                    ObjSchool.AccountAcitve = Convert.ToBoolean(rdr["AccountAcitve"]);
                    ObjSchool.SecretQuestion = Convert.ToString(rdr["SecretQuestion"]);
                    ObjSchool.SecretAnswer = Convert.ToString(rdr["SecretAnswer"]);
                    ObjSchool.BusinessTypeId = Convert.ToInt32(rdr["BusinessTypeId"]);
                    ObjSchool.FormBackColor = Convert.ToString(rdr["FormBackColor"]);
                    ObjSchool.TabFocusedBackColor = Convert.ToString(rdr["TabFocusedBackColor"]);
                    ObjSchool.TabFocusedForeColor = Convert.ToString(rdr["TabFocusedForeColor"]);
                    ObjSchool.TabNonFocusedBackColor = Convert.ToString(rdr["TabNonFocusedBackColor"]);
                    ObjSchool.TabNonFocusedForeColor = Convert.ToString(rdr["TabNonFocusedForeColor"]);
                }
                sqlConnection.Close();
                return ObjSchool;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public School GetSchools_SchoolCodeWiseWithBusinessType(string strSchoolCode)
    {
        try
        {
            School ObjSchool = new School();
             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_School", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 15;
                cmd.Parameters.Add(new SqlParameter("@SchoolCode", SqlDbType.VarChar)).Value = strSchoolCode;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    ObjSchool.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjSchool.SchoolName = Convert.ToString(rdr["SchoolName"]);
                    ObjSchool.SchoolPassword = Convert.ToString(rdr["SchoolPassword"]);
                    ObjSchool.SchoolEmail = Convert.ToString(rdr["SchoolEmail"]);
                    ObjSchool.SchoolAddress = Convert.ToString(rdr["SchoolAddress"]);
                    ObjSchool.SchoolLogo = Convert.ToString(rdr["SchoolLogo"]);
                    ObjSchool.SchoolPhoneNumber = Convert.ToString(rdr["SchoolPhoneNumber"]);
                    ObjSchool.SchoolGuid = Convert.ToString(rdr["SchoolGuid"]);
                    ObjSchool.SchoolCode = Convert.ToString(rdr["SchoolCode"]);
                    ObjSchool.AccountAcitve = Convert.ToBoolean(rdr["AccountAcitve"]);
                    ObjSchool.SecretQuestion = Convert.ToString(rdr["SecretQuestion"]);
                    ObjSchool.SecretAnswer = Convert.ToString(rdr["SecretAnswer"]);
                    ObjSchool.BusinessTypeId = Convert.ToInt32(rdr["BusinessTypeId"]);
                    ObjSchool.FormBackColor = Convert.ToString(rdr["FormBackColor"]);
                    ObjSchool.TabFocusedBackColor = Convert.ToString(rdr["TabFocusedBackColor"]);
                    ObjSchool.TabFocusedForeColor = Convert.ToString(rdr["TabFocusedForeColor"]);
                    ObjSchool.TabNonFocusedBackColor = Convert.ToString(rdr["TabNonFocusedBackColor"]);
                    ObjSchool.TabNonFocusedForeColor = Convert.ToString(rdr["TabNonFocusedForeColor"]);
                    ObjSchool.BusinessTypeTitle = Convert.ToString(rdr["BusinessTypeTitle"]);
                }
                sqlConnection.Close();
                return ObjSchool;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    [WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    public List<School> GetAllSchools()
    {
        try
        {
            List<School> lstSchool = new List<School>();

            // 
            //{
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_School", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    School ObjSchool = new School();
                    ObjSchool.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjSchool.SchoolName = Convert.ToString(rdr["SchoolName"]);
                    ObjSchool.SchoolPassword = Convert.ToString(rdr["SchoolPassword"]);
                    ObjSchool.SchoolEmail = Convert.ToString(rdr["SchoolEmail"]);
                    ObjSchool.SchoolAddress = Convert.ToString(rdr["SchoolAddress"]);
                    ObjSchool.SchoolLogo = Convert.ToString(rdr["SchoolLogo"]);
                    ObjSchool.SchoolPhoneNumber = Convert.ToString(rdr["SchoolPhoneNumber"]);
                    ObjSchool.SchoolGuid = Convert.ToString(rdr["SchoolGuid"]);
                    ObjSchool.SchoolCode = Convert.ToString(rdr["SchoolCode"]);
                    ObjSchool.AccountAcitve = Convert.ToBoolean(rdr["AccountAcitve"]);
                    ObjSchool.SecretQuestion = Convert.ToString(rdr["SecretQuestion"]);
                    ObjSchool.SecretAnswer = Convert.ToString(rdr["SecretAnswer"]);
                    ObjSchool.BusinessTypeId = Convert.ToInt32(rdr["BusinessTypeId"]);
                    ObjSchool.FormBackColor = Convert.ToString(rdr["FormBackColor"]);
                    ObjSchool.TabFocusedBackColor = Convert.ToString(rdr["TabFocusedBackColor"]);
                    ObjSchool.TabFocusedForeColor = Convert.ToString(rdr["TabFocusedForeColor"]);
                    ObjSchool.TabNonFocusedBackColor = Convert.ToString(rdr["TabNonFocusedBackColor"]);
                    ObjSchool.TabNonFocusedForeColor = Convert.ToString(rdr["TabNonFocusedForeColor"]);

                    lstSchool.Add(ObjSchool);
                }
                sqlConnection.Close();
                return lstSchool.ToList();
            //}
            //else
            //{
            //    return lstSchool;
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<User> GetAllUsers()
    {
        try
        {
            List<User> lstUser = new List<User>();
             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_User", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    User ObjUser = new User();
                    ObjUser.UserId = Convert.ToInt32(rdr["UserId"]);
                    ObjUser.UserTypeId = Convert.ToInt32(rdr["UserTypeId"]);
                    ObjUser.UserFristName = Convert.ToString(rdr["UserFristName"]);
                    ObjUser.UserLastName = Convert.ToString(rdr["UserLastName"]);
                    ObjUser.UserEmail = Convert.ToString(rdr["UserEmail"]);
                    ObjUser.UserAddress1 = Convert.ToString(rdr["UserAddress1"]);
                    ObjUser.UserAddress2 = Convert.ToString(rdr["UserAddress2"]);
                    ObjUser.UserGender = Convert.ToString(rdr["UserGender"]);
                    ObjUser.UserPassword = Convert.ToString(rdr["UserPassword"]);
                    ObjUser.UserPhoneNo = Convert.ToString(rdr["UserPhoneNo"]);
                    ObjUser.UserGuid = Convert.ToString(rdr["UserGuid"]);
                    ObjUser.UserCode = Convert.ToString(rdr["UserCode"]);
                    ObjUser.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdateDate"]))
                    {
                        ObjUser.UpdatedDate = Convert.ToDateTime(rdr["UpdateDate"]);
                    }
                    lstUser.Add(ObjUser);
                }
                sqlConnection.Close();
                return lstUser.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<User> GetUsers_UserIdWise(int intUserId)
    {
        try
        {
            IList<User> lstUser = new List<User>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_User", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@UserId", SqlDbType.Int)).Value = intUserId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    User ObjUser = new User();
                    ObjUser.UserId = Convert.ToInt32(rdr["UserId"]);
                    ObjUser.UserTypeId = Convert.ToInt32(rdr["UserTypeId"]);
                    ObjUser.UserFristName = Convert.ToString(rdr["UserFristName"]);
                    ObjUser.UserLastName = Convert.ToString(rdr["UserLastName"]);
                    ObjUser.UserEmail = Convert.ToString(rdr["UserEmail"]);
                    ObjUser.UserAddress1 = Convert.ToString(rdr["UserAddress1"]);
                    ObjUser.UserAddress2 = Convert.ToString(rdr["UserAddress2"]);
                    ObjUser.UserGender = Convert.ToString(rdr["UserGender"]);
                    ObjUser.UserPassword = Convert.ToString(rdr["UserPassword"]);
                    ObjUser.UserPhoneNo = Convert.ToString(rdr["UserPhoneNo"]);
                    ObjUser.UserGuid = Convert.ToString(rdr["UserGuid"]);
                    ObjUser.UserCode = Convert.ToString(rdr["UserCode"]);
                    ObjUser.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdateDate"]))
                    {
                        ObjUser.UpdatedDate = Convert.ToDateTime(rdr["UpdateDate"]);
                    }
                    lstUser.Add(ObjUser);
                }
                sqlConnection.Close();
                return lstUser.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<User> GetUsers_EmailPasswordWise(string strEmail, string strPassword)
    {
        try
        {
            IList<User> lstUser = new List<User>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_User", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@UserEmail", SqlDbType.VarChar)).Value = strEmail;
                cmd.Parameters.Add(new SqlParameter("@UserPassword", SqlDbType.VarChar)).Value = strPassword;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    User ObjUser = new User();
                    ObjUser.UserId = Convert.ToInt32(rdr["UserId"]);
                    ObjUser.UserTypeId = Convert.ToInt32(rdr["UserTypeId"]);
                    ObjUser.UserFristName = Convert.ToString(rdr["UserFristName"]);
                    ObjUser.UserLastName = Convert.ToString(rdr["UserLastName"]);
                    ObjUser.UserEmail = Convert.ToString(rdr["UserEmail"]);
                    ObjUser.UserAddress1 = Convert.ToString(rdr["UserAddress1"]);
                    ObjUser.UserAddress2 = Convert.ToString(rdr["UserAddress2"]);
                    ObjUser.UserGender = Convert.ToString(rdr["UserGender"]);
                    ObjUser.UserPassword = Convert.ToString(rdr["UserPassword"]);
                    ObjUser.UserPhoneNo = Convert.ToString(rdr["UserPhoneNo"]);
                    ObjUser.UserGuid = Convert.ToString(rdr["UserGuid"]);
                    ObjUser.UserCode = Convert.ToString(rdr["UserCode"]);
                    ObjUser.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                   if (!Convert.IsDBNull(rdr["UpdateDate"]))
                    {
                        ObjUser.UpdatedDate = Convert.ToDateTime(rdr["UpdateDate"]);
                    }
                    lstUser.Add(ObjUser);
                }
                sqlConnection.Close();
                return lstUser.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    //added by khalid 20-3-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<User> GetBcakOfficeUser_ByEmailandPassword(string strEmail, string strPassword)
    {
        try
        {
            IList<User> lstUser = new List<User>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_User", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@UserEmail", SqlDbType.VarChar)).Value = strEmail;
                cmd.Parameters.Add(new SqlParameter("@UserPassword", SqlDbType.VarChar)).Value = strPassword;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    User ObjUser = new User();
                    ObjUser.UserId = Convert.ToInt32(rdr["UserId"]);
                    ObjUser.UserFristName = Convert.ToString(rdr["UserFristName"]);
                    ObjUser.UserLastName = Convert.ToString(rdr["UserLastName"]);
                    ObjUser.UserEmail = Convert.ToString(rdr["UserEmail"]);
                    ObjUser.UserGender = Convert.ToString(rdr["UserGender"]);
                    ObjUser.UserPassword = Convert.ToString(rdr["UserPassword"]);
                    ObjUser.UserPhoneNo = Convert.ToString(rdr["UserPhoneNo"]);
                    ObjUser.UserGuid = Convert.ToString(rdr["UserGuid"]);
                    ObjUser.UserCode = Convert.ToString(rdr["UserCode"]);
                    ObjUser.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjUser.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    if (!Convert.IsDBNull(rdr["UpdateDate"]))
                    {
                        ObjUser.UpdatedDate = Convert.ToDateTime(rdr["UpdateDate"]);
                    }
                    lstUser.Add(ObjUser);
                }
                sqlConnection.Close();
                return lstUser.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //added by khalid 20-3-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<User> GetBcakOfficeUser_ByEmail(string strEmail)
    {
        try
        {
            IList<User> lstUser = new List<User>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_User", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@UserEmail", SqlDbType.VarChar)).Value = strEmail;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 7;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    User ObjUser = new User();
                    ObjUser.UserId = Convert.ToInt32(rdr["UserId"]);
                    ObjUser.UserFristName = Convert.ToString(rdr["UserFristName"]);
                    ObjUser.UserLastName = Convert.ToString(rdr["UserLastName"]);
                    ObjUser.UserEmail = Convert.ToString(rdr["UserEmail"]);
                    ObjUser.UserGender = Convert.ToString(rdr["UserGender"]);
                    ObjUser.UserPassword = Convert.ToString(rdr["UserPassword"]);
                    ObjUser.UserPhoneNo = Convert.ToString(rdr["UserPhoneNo"]);
                    ObjUser.UserGuid = Convert.ToString(rdr["UserGuid"]);
                    ObjUser.UserCode = Convert.ToString(rdr["UserCode"]);
                    ObjUser.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjUser.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    if (!Convert.IsDBNull(rdr["UpdateDate"]))
                    {
                        ObjUser.UpdatedDate = Convert.ToDateTime(rdr["UpdateDate"]);
                    }
                    lstUser.Add(ObjUser);
                }
                sqlConnection.Close();
                return lstUser.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<ResourcesType> GetAllResourcesType()
    {
        try
        {
            IList<ResourcesType> lstResourcesType = new List<ResourcesType>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_ResourcesType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    ResourcesType ObjResourcesType = new ResourcesType();
                    ObjResourcesType.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResourcesType.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResourcesType.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjResourcesType.ResourceTypeTitle = Convert.ToString(rdr["ResourceTypeTitle"]);
                    ObjResourcesType.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResourcesType.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResourcesType.Add(ObjResourcesType);
                }
                sqlConnection.Close();
                return lstResourcesType.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<ResourcesType> GetResourcesType_ResourcesTypeIdWise(int intResourcesTypeId)
    {
        try
        {
            IList<ResourcesType> lstResourcesType = new List<ResourcesType>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_ResourcesType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ResourcesTypeId", SqlDbType.Int)).Value = intResourcesTypeId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    ResourcesType ObjResourcesType = new ResourcesType();
                    ObjResourcesType.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResourcesType.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResourcesType.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjResourcesType.ResourceTypeTitle = Convert.ToString(rdr["ResourceTypeTitle"]);
                    ObjResourcesType.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResourcesType.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResourcesType.Add(ObjResourcesType);
                }
                sqlConnection.Close();
                return lstResourcesType.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<ResourcesType> GetResourcesType_SchoolIdWise(int SchoolId)
    {
        try
        {
            IList<ResourcesType> lstResourcesType = new List<ResourcesType>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_ResourcesType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    ResourcesType ObjResourcesType = new ResourcesType();
                    ObjResourcesType.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResourcesType.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResourcesType.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjResourcesType.ResourceTypeTitle = Convert.ToString(rdr["ResourceTypeTitle"]);
                    ObjResourcesType.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResourcesType.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResourcesType.Add(ObjResourcesType);
                }
                sqlConnection.Close();
                return lstResourcesType.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<ResourcesType> GetResourcesType_SchoolChannelWise(int SchoolId, int ChannelId)
    {
        try
        {
            IList<ResourcesType> lstResourcesType = new List<ResourcesType>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_ResourcesType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = ChannelId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 8;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    ResourcesType ObjResourcesType = new ResourcesType();
                    ObjResourcesType.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResourcesType.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResourcesType.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjResourcesType.ResourceTypeTitle = Convert.ToString(rdr["ResourceTypeTitle"]);
                    ObjResourcesType.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResourcesType.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResourcesType.Add(ObjResourcesType);
                }
                sqlConnection.Close();
                return lstResourcesType.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Resources> GetAllResources()
    {
        try
        {
            IList<Resources> lstResources = new List<Resources>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Resources", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Resources ObjResources = new Resources();
                    ObjResources.ResourcesId = Convert.ToInt32(rdr["ResourcesId"]);
                    ObjResources.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResources.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjResources.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResources.ResourcesTitle = Convert.ToString(rdr["ResourcesTitle"]);
                    ObjResources.ResourcesDescription = Convert.ToString(rdr["ResourcesDescription"]);
                    ObjResources.ResourceDate = Convert.ToDateTime(rdr["ResourceDate"]);
                    ObjResources.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResources.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResources.Add(ObjResources);
                }
                sqlConnection.Close();
                return lstResources.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Resources> GetResources_ResourceIdWise(int intResourceId)
    {
        try
        {
            IList<Resources> lstResources = new List<Resources>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Resources", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ResourcesId", SqlDbType.Int)).Value = intResourceId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Resources ObjResources = new Resources();
                    ObjResources.ResourcesId = Convert.ToInt32(rdr["ResourcesId"]);
                    ObjResources.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResources.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjResources.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResources.ResourcesTitle = Convert.ToString(rdr["ResourcesTitle"]);
                    ObjResources.ResourcesDescription = Convert.ToString(rdr["ResourcesDescription"]);
                    ObjResources.ResourceDate = Convert.ToDateTime(rdr["ResourceDate"]);
                    ObjResources.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResources.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResources.Add(ObjResources);
                }
                sqlConnection.Close();
                return lstResources.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Resources> GetResources_ResourceResourcesTypeIdWise(int ResourcesTypeId)
    {
        try
        {
            IList<Resources> lstResources = new List<Resources>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Resources", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ResourcesTypeId", SqlDbType.Int)).Value = ResourcesTypeId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 9;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Resources ObjResources = new Resources();
                    ObjResources.ResourcesId = Convert.ToInt32(rdr["ResourcesId"]);
                    ObjResources.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResources.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjResources.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResources.ResourcesTitle = Convert.ToString(rdr["ResourcesTitle"]);
                    ObjResources.ResourcesDescription = Convert.ToString(rdr["ResourcesDescription"]);
                    ObjResources.ResourceDate = Convert.ToDateTime(rdr["ResourceDate"]);
                    ObjResources.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResources.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResources.Add(ObjResources);
                }
                sqlConnection.Close();
                return lstResources.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Resources> GetResources_SchoolChannelWise(int SchoolId, int ChannelId)
    {
        try
        {
            IList<Resources> lstResources = new List<Resources>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Resources", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = ChannelId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 8;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Resources ObjResources = new Resources();
                    ObjResources.ResourcesId = Convert.ToInt32(rdr["ResourcesId"]);
                    ObjResources.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResources.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjResources.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResources.ResourcesTitle = Convert.ToString(rdr["ResourcesTitle"]);
                    ObjResources.ResourcesDescription = Convert.ToString(rdr["ResourcesDescription"]);
                    ObjResources.ResourceDate = Convert.ToDateTime(rdr["ResourceDate"]);
                    ObjResources.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResources.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResources.Add(ObjResources);
                }
                sqlConnection.Close();
                return lstResources.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    public List<Resources> GetResources_SchoolIdWise(int SchoolId)
    {
        try
        {
            IList<Resources> lstResources = new List<Resources>();

            // 
            //{
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Resources", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Resources ObjResources = new Resources();
                    ObjResources.ResourcesId = Convert.ToInt32(rdr["ResourcesId"]);
                    ObjResources.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResources.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjResources.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResources.ResourcesTitle = Convert.ToString(rdr["ResourcesTitle"]);
                    ObjResources.ResourcesDescription = Convert.ToString(rdr["ResourcesDescription"]);
                    ObjResources.ResourceDate = Convert.ToDateTime(rdr["ResourceDate"]);
                    ObjResources.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResources.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResources.Add(ObjResources);
                }
                sqlConnection.Close();
                return lstResources.ToList();
            //}
            //else
            //{
            //    return lstResources.ToList();
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Resources> GetAllResourcesSchoolId_ResourceTitle(int SchoolId, string ResourceTitle)
    {
        try
        {
            IList<Resources> lstResources = new List<Resources>();

             
            
            SqlConnection sqlConnection = new SqlConnection(cnnString);
            SqlCommand cmd = new SqlCommand("sp_Resources", sqlConnection) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
            cmd.Parameters.Add(new SqlParameter("@ResourcesTitle", SqlDbType.VarChar)).Value = ResourceTitle;
            cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 10;
            sqlConnection.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Resources ObjResources = new Resources();
                ObjResources.ResourcesId = Convert.ToInt32(rdr["ResourcesId"]);
                ObjResources.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                ObjResources.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                ObjResources.ResourcesTitle = Convert.ToString(rdr["ResourcesTitle"]);
                ObjResources.ResourcesDescription = Convert.ToString(rdr["ResourcesDescription"]);
                ObjResources.ResourceDate = Convert.ToDateTime(rdr["ResourceDate"]);
                ObjResources.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                {
                    ObjResources.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                }
                lstResources.Add(ObjResources);
            }
            sqlConnection.Close();
            return lstResources.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Resources> GetAllResourcesSchoolId_ResourceDescription(int SchoolId, string ResourceDescription)
    {
        try
        {
            IList<Resources> lstResources = new List<Resources>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Resources", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@ResourcesDescription", SqlDbType.VarChar)).Value = ResourceDescription;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 11;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Resources ObjResources = new Resources();
                    ObjResources.ResourcesId = Convert.ToInt32(rdr["ResourcesId"]);
                    ObjResources.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResources.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResources.ResourcesTitle = Convert.ToString(rdr["ResourcesTitle"]);
                    ObjResources.ResourcesDescription = Convert.ToString(rdr["ResourcesDescription"]);
                    ObjResources.ResourceDate = Convert.ToDateTime(rdr["ResourceDate"]);
                    ObjResources.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResources.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResources.Add(ObjResources);
                }
                sqlConnection.Close();
                return lstResources.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Resources> GetAllResourcesSchoolId_ResourceDate(int SchoolId, DateTime ResourceDate)
    {
        try
        {
            IList<Resources> lstResources = new List<Resources>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Resources", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@ResourceDate", SqlDbType.DateTime)).Value = Convert.ToDateTime(ResourceDate).ToString("MM/dd/yyyy"); ;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 12;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Resources ObjResources = new Resources();
                    ObjResources.ResourcesId = Convert.ToInt32(rdr["ResourcesId"]);
                    ObjResources.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjResources.ResourcesTypeId = Convert.ToInt32(rdr["ResourcesTypeId"]);
                    ObjResources.ResourcesTitle = Convert.ToString(rdr["ResourcesTitle"]);
                    ObjResources.ResourcesDescription = Convert.ToString(rdr["ResourcesDescription"]);
                    ObjResources.ResourceDate = Convert.ToDateTime(rdr["ResourceDate"]);
                    ObjResources.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjResources.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstResources.Add(ObjResources);
                }
                sqlConnection.Close();
                return lstResources.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<GalleryType> GetAllGalleryType()
    {
        try
        {
            IList<GalleryType> lstGalleryType = new List<GalleryType>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_GalleryType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    GalleryType ObjGalleryType = new GalleryType();
                    ObjGalleryType.GalleryTypeId = Convert.ToInt32(rdr["GalleryTypeId"]);
                    ObjGalleryType.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjGalleryType.GalleryTypeName = Convert.ToString(rdr["GalleryType"]);
                    ObjGalleryType.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjGalleryType.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstGalleryType.Add(ObjGalleryType);
                }
                sqlConnection.Close();
                return lstGalleryType.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<GalleryType> GetGalleryType_GalleryTypeIdWise(int intGalleryTypeId)
    {
        try
        {
            IList<GalleryType> lstGalleryType = new List<GalleryType>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_GalleryType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@GalleryTypeId", SqlDbType.Int)).Value = intGalleryTypeId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    GalleryType ObjGalleryType = new GalleryType();
                    ObjGalleryType.GalleryTypeId = Convert.ToInt32(rdr["GalleryTypeId"]);
                    ObjGalleryType.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjGalleryType.GalleryTypeName = Convert.ToString(rdr["GalleryType"]);
                    ObjGalleryType.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjGalleryType.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstGalleryType.Add(ObjGalleryType);
                }
                sqlConnection.Close();
                return lstGalleryType.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<GalleryType> GetGalleryType_SchoolIdWise(int intSchoolId)
    {
        try
        {
            IList<GalleryType> lstGalleryType = new List<GalleryType>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_GalleryType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = intSchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    GalleryType ObjGalleryType = new GalleryType();
                    ObjGalleryType.GalleryTypeId = Convert.ToInt32(rdr["GalleryTypeId"]);
                    ObjGalleryType.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjGalleryType.GalleryTypeName = Convert.ToString(rdr["GalleryType"]);
                    ObjGalleryType.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjGalleryType.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstGalleryType.Add(ObjGalleryType);
                }
                sqlConnection.Close();
                return lstGalleryType.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Gallery> GetAllGallery()
    {
        try
        {
            IList<Gallery> lstGallery = new List<Gallery>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Gallery", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Gallery ObjGallery = new Gallery();
                    ObjGallery.GalleryId = Convert.ToInt32(rdr["GalleryId"]);
                    ObjGallery.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjGallery.GalleryTypeId = Convert.ToInt32(rdr["GalleryTypeId"]);
                    ObjGallery.GalleryFilePath = Convert.ToString(rdr["GalleryFilePath"]);
                    ObjGallery.GalleryFileName = Convert.ToString(rdr["GalleryFileName"]);
                    ObjGallery.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjGallery.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstGallery.Add(ObjGallery);
                }
                sqlConnection.Close();
                return lstGallery.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Gallery> GetGallery_SchoolIdTypeWise(int intSchoolId, int GalleryTypeId)
    {
        try
        {
            IList<Gallery> lstGallery = new List<Gallery>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Gallery", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = intSchoolId;
                cmd.Parameters.Add(new SqlParameter("@GalleryTypeId", SqlDbType.Int)).Value = GalleryTypeId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 8;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Gallery ObjGallery = new Gallery();
                    ObjGallery.GalleryId = Convert.ToInt32(rdr["GalleryId"]);
                    ObjGallery.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjGallery.GalleryTypeId = Convert.ToInt32(rdr["GalleryTypeId"]);
                    ObjGallery.GalleryFilePath = Convert.ToString(rdr["GalleryFilePath"]);
                    ObjGallery.GalleryFileName = Convert.ToString(rdr["GalleryFileName"]);
                    ObjGallery.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjGallery.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstGallery.Add(ObjGallery);
                }
                sqlConnection.Close();
                return lstGallery.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    public List<Gallery> GetGallery_SchoolIdWise(int intSchoolId)
    {
        try
        {
            IList<Gallery> lstGallery = new List<Gallery>();

            // 
            //{
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Gallery", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = intSchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Gallery ObjGallery = new Gallery();
                    ObjGallery.GalleryId = Convert.ToInt32(rdr["GalleryId"]);
                    ObjGallery.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjGallery.GalleryTypeId = Convert.ToInt32(rdr["GalleryTypeId"]);
                    ObjGallery.GalleryFilePath = Convert.ToString(rdr["GalleryFilePath"]);
                    ObjGallery.GalleryFileName = Convert.ToString(rdr["GalleryFileName"]);
                    ObjGallery.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjGallery.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstGallery.Add(ObjGallery);
                }
                sqlConnection.Close();
                return lstGallery.ToList();
            //}
            //else
            //{
            //    return lstGallery.ToList();
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Gallery> GetGallery_GalleryIdWise(int intGalleryId)
    {
        try
        {
            IList<Gallery> lstGallery = new List<Gallery>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Gallery", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@GalleryId", SqlDbType.Int)).Value = intGalleryId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Gallery ObjGallery = new Gallery();
                    ObjGallery.GalleryId = Convert.ToInt32(rdr["GalleryId"]);
                    ObjGallery.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjGallery.GalleryTypeId = Convert.ToInt32(rdr["@GalleryTypeId"]);
                    ObjGallery.GalleryFilePath = Convert.ToString(rdr["GalleryFilePath"]);
                    ObjGallery.GalleryFileName = Convert.ToString(rdr["GalleryFileName"]);
                    ObjGallery.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjGallery.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstGallery.Add(ObjGallery);
                }
                sqlConnection.Close();
                return lstGallery.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Child> GetAllChild()
    {
        try
        {
            IList<Child> lstChild = new List<Child>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Child", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Child ObjChild = new Child();
                    ObjChild.ChildId = Convert.ToInt32(rdr["ChildId"]);
                    ObjChild.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChild.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChild.ChildofUserId = Convert.ToInt32(rdr["ChildofUserId"]);
                    ObjChild.ChildFirstName = Convert.ToString(rdr["ChildFirstName"]);
                    ObjChild.ChildLastName = Convert.ToString(rdr["ChildLastName"]);
                    ObjChild.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChild.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChild.Add(ObjChild);
                }
                sqlConnection.Close();
                return lstChild.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Child> GetChilds_ChildIdWise(int intChildId)
    {
        try
        {
            IList<Child> lstChild = new List<Child>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Child", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ChildId", SqlDbType.Int)).Value = intChildId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Child ObjChild = new Child();
                    ObjChild.ChildId = Convert.ToInt32(rdr["ChildId"]);
                    ObjChild.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChild.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChild.ChildofUserId = Convert.ToInt32(rdr["ChildofUserId"]);
                    ObjChild.ChildFirstName = Convert.ToString(rdr["ChildFirstName"]);
                    ObjChild.ChildLastName = Convert.ToString(rdr["ChildLastName"]);
                    ObjChild.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChild.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChild.Add(ObjChild);
                }
                sqlConnection.Close();
                return lstChild.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Child> GetChild_SchoolIdWise(int SchoolId)
    {
        try
        {
            IList<Child> lstChild = new List<Child>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Child", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Child ObjChild = new Child();
                    ObjChild.ChildId = Convert.ToInt32(rdr["ChildId"]);
                    ObjChild.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChild.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChild.ChildofUserId = Convert.ToInt32(rdr["ChildofUserId"]);
                    ObjChild.ChildFirstName = Convert.ToString(rdr["ChildFirstName"]);
                    ObjChild.ChildLastName = Convert.ToString(rdr["ChildLastName"]);
                    ObjChild.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChild.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChild.Add(ObjChild);
                }
                sqlConnection.Close();
                return lstChild.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetAllCalendar()
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendar_CalendarIdWise(string intCalendarId)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@CalendarId", SqlDbType.Int)).Value = intCalendarId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjCalendar.EventImage = Convert.ToString(rdr["EventImage"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    //commented by khalid 11-1-13
    //uncommented by khalid 15-1-13
    public List<Calendar> GetCalendar_SchoolChannelWise(int SchoolId, int ChannelId)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = ChannelId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 8;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjCalendar.EventImage = Convert.ToString(rdr["EventImage"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    
    //added by khalid 11-1-13
    //updated by khalid 15-1-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendar_SchoolChannelSchoolUserIdWise(int SchoolId, int ChannelId, int SchoolUserId)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = ChannelId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 17;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = SchoolUserId;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjCalendar.EventImage = Convert.ToString(rdr["EventImage"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    


    [WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendar_SchoolWise(int SchoolId)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

            // 
            //{
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 9;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            //}
            //else
            //{
            //    return lstCalendar.ToList();
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //commented by khalid 11-1-13
    //uncommented by khalid 15-1-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendar_SchoolIdWise(string SchoolId)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjCalendar.EventImage = Convert.ToString(rdr["EventImage"]);
                    ObjCalendar.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //added by khalid 10-1-13
    //updated by khalid 15-1-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendar_SchoolIdSchoolUserIdWise(string SchoolId, int SchoolUserId)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 17;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = SchoolUserId;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjCalendar.EventImage = Convert.ToString(rdr["EventImage"]);
                    ObjCalendar.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetEventEndDate_SchoolIdWise(string SchoolId)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 16;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //Search Calendar
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendarBySchoolId_EventTitle(int SchoolId, string EventTitle)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@CalendarEventTitle", SqlDbType.VarChar)).Value = EventTitle;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 10;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendarBySchoolId_EventDescription(int SchoolId, string EventDescription)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@CalendarEventDescription", SqlDbType.VarChar)).Value = EventDescription;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 11;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendarBySchoolId_EventStartDate(int SchoolId, DateTime EventStartDate)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@EventStartDate", SqlDbType.DateTime)).Value = Convert.ToDateTime(EventStartDate).ToString("MM/dd/yyyy");
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 12;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendarBySchoolId_EventEndDate(int SchoolId, DateTime EventEndDate)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@EventEndDate", SqlDbType.DateTime)).Value = Convert.ToDateTime(EventEndDate).ToString("MM/dd/yyyy");
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 13;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Calendar> GetCalendarBySchoolId_EventStartDate_EventEndDate(int SchoolId, DateTime EventStartDate, DateTime EventEndDate)
    {
        try
        {
            IList<Calendar> lstCalendar = new List<Calendar>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Calendar", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@EventStartDate", SqlDbType.DateTime)).Value = Convert.ToDateTime(EventStartDate).ToString("MM/dd/yyyy");
                cmd.Parameters.Add(new SqlParameter("@EventEndDate", SqlDbType.DateTime)).Value = Convert.ToDateTime(EventEndDate).ToString("MM/dd/yyyy");
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 14;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Calendar ObjCalendar = new Calendar();
                    ObjCalendar.CalendarId = Convert.ToInt32(rdr["CalendarId"]);
                    ObjCalendar.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjCalendar.CalendarEventTitle = Convert.ToString(rdr["CalendarEventTitle"]);
                    ObjCalendar.CalendarEventDescription = Convert.ToString(rdr["CalendarEventDescription"]);
                    ObjCalendar.EventStartDate = Convert.ToDateTime(rdr["EventStartDate"]);
                    ObjCalendar.EventEndDate = Convert.ToDateTime(rdr["EventEndDate"]);
                    ObjCalendar.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjCalendar.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstCalendar.Add(ObjCalendar);
                }
                sqlConnection.Close();
                return lstCalendar.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Channel> GetAllChannels()
    {
        try
        {
            IList<Channel> lstChannel = new List<Channel>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Channel", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Channel ObjChannel = new Channel();
                    ObjChannel.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChannel.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChannel.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjChannel.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChannel.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChannel.Add(ObjChannel);
                }
                sqlConnection.Close();
                return lstChannel.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Channel> GetChannels_ChannelIdWise(int intChannelId)
    {
        try
        {
            IList<Channel> lstChannel = new List<Channel>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Channel", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = intChannelId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Channel ObjChannel = new Channel();
                    ObjChannel.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChannel.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChannel.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjChannel.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjChannel.IsActive = Convert.ToBoolean(rdr["IsActive"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChannel.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChannel.Add(ObjChannel);
                }
                sqlConnection.Close();
                return lstChannel.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Channel> UpdateChannel_ChannelIdWise(int intChannelId, bool isActive)
    {
        try
        {
            IList<Channel> lstChannel = new List<Channel>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Channel", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = intChannelId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 8;
                cmd.Parameters.Add(new SqlParameter("@IsActive", SqlDbType.Int)).Value = isActive;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Channel ObjChannel = new Channel();
                    ObjChannel.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChannel.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChannel.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjChannel.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjChannel.IsActive = Convert.ToBoolean(rdr["IsActive"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChannel.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChannel.Add(ObjChannel);
                }
                sqlConnection.Close();
                return lstChannel.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Channel> GetChannels_SchoolIdWise(int SchoolId)
    {
        try
        {
            IList<Channel> lstChannel = new List<Channel>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Channel", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Channel ObjChannel = new Channel();
                    ObjChannel.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChannel.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChannel.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjChannel.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjChannel.IsActive = Convert.ToBoolean(rdr["IsActive"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChannel.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChannel.Add(ObjChannel);
                }
                sqlConnection.Close();
                return lstChannel.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    
    //commented by khalid 11-1-13
    //uncommented by khalid 15-1-13    
    public List<Channel> GetUserActiveChannels_SchoolIdWise(int SchoolId)
    {
        try
        {
            IList<Channel> lstChannel = new List<Channel>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Channel", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 10;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Channel ObjChannel = new Channel();
                    ObjChannel.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChannel.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChannel.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjChannel.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjChannel.IsActive = Convert.ToBoolean(rdr["IsActive"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChannel.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChannel.Add(ObjChannel);
                }
                sqlConnection.Close();
                return lstChannel.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

     //added by khalid 15-1-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Channel> GetUserActiveChannels_SchoolIdSchoolUserIdWise(int SchoolId, int SchoolUserId)
    {
        try
        {
            IList<Channel> lstChannel = new List<Channel>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Channel", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 11;
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = SchoolUserId;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Channel ObjChannel = new Channel();
                    ObjChannel.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChannel.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChannel.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjChannel.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjChannel.IsActive = Convert.ToBoolean(rdr["IsActive"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChannel.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChannel.Add(ObjChannel);
                }
                sqlConnection.Close();
                return lstChannel.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    
    

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Channel> GetActiveChannels_SchoolIdWise(int SchoolId)
    {
        try
        {
            IList<Channel> lstChannel = new List<Channel>();

             
             SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Channel", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 9;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Channel ObjChannel = new Channel();
                    ObjChannel.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjChannel.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjChannel.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjChannel.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjChannel.IsActive = Convert.ToBoolean(rdr["IsActive"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjChannel.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstChannel.Add(ObjChannel);
                }
                sqlConnection.Close();
                return lstChannel.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<UserType> GetAllUserType()
    {
        try
        {
            IList<UserType> ConfList = new List<UserType>();

             
            SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_UserType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    UserType ObjUser = new UserType();
                    ObjUser.UserTypeId = Convert.ToInt32(rdr["UserTypeId"]);
                    ObjUser.UserTypeName = Convert.ToString(rdr["UserType"]);
                    ConfList.Add(ObjUser);
                }
                sqlConnection.Close();
                return ConfList.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<UserType> GetUserType_UserTypeIdWise(int intUserTypeId)
    {
        try
        {
            IList<UserType> ConfList = new List<UserType>();

           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_UserType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@UserTypeId", SqlDbType.Int)).Value = intUserTypeId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    UserType ObjUser = new UserType();
                    ObjUser.UserTypeId = Convert.ToInt32(rdr["UserTypeId"]);
                    ObjUser.UserTypeName = Convert.ToString(rdr["UserType"]);
                    ConfList.Add(ObjUser);
                }
                sqlConnection.Close();
                return ConfList.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<UserType> GetUserType_UserIdWise(int intUserId)
    {
        try
        {
            IList<UserType> ConfList = new List<UserType>();

             
              SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_UserType", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = intUserId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    UserType ObjUser = new UserType();
                    ObjUser.UserTypeId = Convert.ToInt32(rdr["UserTypeId"]);
                    ObjUser.UserTypeName = Convert.ToString(rdr["UserType"]);
                    ConfList.Add(ObjUser);
                }
                sqlConnection.Close();
                return ConfList.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Personalise> GetPersonalise_PersonaliseIdWise(int intPersonaliseId)
    {
        try
        {
            List<Personalise> lstPersonalise = new List<Personalise>();

             
              SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Personalise", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@PersonaliseId", SqlDbType.Int)).Value = intPersonaliseId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 4;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Personalise ObjPersonalise = new Personalise();
                    ObjPersonalise.PersonaliseId = Convert.ToInt32(rdr["PersonaliseId"]);
                    ObjPersonalise.LanguageId = Convert.ToInt32(rdr["LanguageId"]);
                    ObjPersonalise.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjPersonalise.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjPersonalise.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjPersonalise.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstPersonalise.Add(ObjPersonalise);
                }
                sqlConnection.Close();
                return lstPersonalise.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Personalise> GetPersonalise_SchoolIdWise(int SchoolId)
    {
        try
        {
            List<Personalise> lstPersonalise = new List<Personalise>();

             
             SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Personalise", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Personalise ObjPersonalise = new Personalise();
                    ObjPersonalise.PersonaliseId = Convert.ToInt32(rdr["PersonaliseId"]);
                    ObjPersonalise.LanguageId = Convert.ToInt32(rdr["LanguageId"]);
                    ObjPersonalise.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjPersonalise.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjPersonalise.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjPersonalise.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstPersonalise.Add(ObjPersonalise);
                }
                sqlConnection.Close();
                return lstPersonalise.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Personalise> GetAllPersonalise()
    {
        try
        {
            List<Personalise> lstPersonalise = new List<Personalise>();

             
             SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Personalise", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Personalise ObjPersonalise = new Personalise();
                    ObjPersonalise.PersonaliseId = Convert.ToInt32(rdr["PersonaliseId"]);
                    ObjPersonalise.LanguageId = Convert.ToInt32(rdr["LanguageId"]);
                    ObjPersonalise.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjPersonalise.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjPersonalise.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjPersonalise.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstPersonalise.Add(ObjPersonalise);
                }
                sqlConnection.Close();
                return lstPersonalise.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Language> GetLanguage_LanguageIdWise(int intLanguageId)
    {
        try
        {
            List<Language> lstLanguage = new List<Language>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Language", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@LanguageId", SqlDbType.Int)).Value = intLanguageId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 6;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Language ObjLanguage = new Language();
                    ObjLanguage.LanguageId = Convert.ToInt32(rdr["LanguageId"]);
                    ObjLanguage.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjLanguage.LanguageTitle = Convert.ToString(rdr["LanguageTitle"]);
                    ObjLanguage.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjLanguage.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstLanguage.Add(ObjLanguage);
                }
                sqlConnection.Close();
                return lstLanguage.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Language> GetLanguage_SchoolIdWise(int SchoolId)
    {
        try
        {
            List<Language> lstLanguage = new List<Language>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Language", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Language ObjLanguage = new Language();
                    ObjLanguage.LanguageId = Convert.ToInt32(rdr["LanguageId"]);
                    ObjLanguage.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjLanguage.LanguageTitle = Convert.ToString(rdr["LanguageTitle"]);
                    ObjLanguage.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjLanguage.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstLanguage.Add(ObjLanguage);
                }
                sqlConnection.Close();
                return lstLanguage.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Language> GetAllLanguage()
    {
        try
        {
            List<Language> lstLanguage = new List<Language>();

            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Language", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 1;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Language ObjLanguage = new Language();
                    ObjLanguage.LanguageId = Convert.ToInt32(rdr["LanguageId"]);
                    ObjLanguage.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjLanguage.LanguageTitle = Convert.ToString(rdr["LanguageTitle"]);
                    ObjLanguage.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjLanguage.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstLanguage.Add(ObjLanguage);
                }
                sqlConnection.Close();
                return lstLanguage.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Contact> GetContact_ContactIdWise(int intContactId)
    {
        try
        {
            List<Contact> lstContact = new List<Contact>();

             
             SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Contact", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ContactId", SqlDbType.Int)).Value = intContactId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Contact ObjContact = new Contact();
                    ObjContact.ContactId = Convert.ToInt32(rdr["ContactId"]);
                    ObjContact.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjContact.StaffName = Convert.ToString(rdr["StaffName"]);
                    ObjContact.Address = Convert.ToString(rdr["Address"]);
                    ObjContact.PhoneNo = Convert.ToString(rdr["PhoneNo"]);
                    ObjContact.EmailAddress = Convert.ToString(rdr["EmailAddress"]);
                    ObjContact.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjContact.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    ObjContact.Designation = Convert.ToString(rdr["Designation"]);

                    lstContact.Add(ObjContact);
                }
                sqlConnection.Close();
                return lstContact.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    public List<Contact> GetContact_SchoolIdWise(int SchoolId)
    {
        try
        {
            List<Contact> lstContact = new List<Contact>();

            // 
            //{
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Contact", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 4;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Contact ObjContact = new Contact();
                    ObjContact.ContactId = Convert.ToInt32(rdr["ContactId"]);
                    ObjContact.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjContact.StaffName = Convert.ToString(rdr["StaffName"]);
                    ObjContact.Address = Convert.ToString(rdr["Address"]);
                    ObjContact.PhoneNo = Convert.ToString(rdr["PhoneNo"]);
                    ObjContact.EmailAddress = Convert.ToString(rdr["EmailAddress"]);
                    ObjContact.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjContact.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    ObjContact.Designation = Convert.ToString(rdr["Designation"]);

                    lstContact.Add(ObjContact);
                }
                sqlConnection.Close();
                return lstContact.ToList();
            //}
            //else
            //{
            //    return lstContact.ToList();
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Contact> GetAllContacts()
    {
        try
        {
            List<Contact> lstContact = new List<Contact>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Contact", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 5;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Contact ObjContact = new Contact();
                    ObjContact.ContactId = Convert.ToInt32(rdr["ContactId"]);
                    ObjContact.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjContact.StaffName = Convert.ToString(rdr["StaffName"]);
                    ObjContact.Address = Convert.ToString(rdr["Address"]);
                    ObjContact.PhoneNo = Convert.ToString(rdr["PhoneNo"]);
                    ObjContact.EmailAddress = Convert.ToString(rdr["EmailAddress"]);
                    ObjContact.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);

                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjContact.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstContact.Add(ObjContact);
                }
                sqlConnection.Close();
                return lstContact.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<News> GetNews_NewsIdWise(int intNewsId)
    {
        try
        {
            List<News> lstNews = new List<News>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@NewsId", SqlDbType.Int)).Value = intNewsId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();
                return lstNews.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    //uncommented by khalid 15-1-13
    public List<News> GetNews_NewsChannelSchoolWise(int intChannelId, int SchoolId)
    {
        try
        {
            List<News> lstNews = new List<News>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = intChannelId;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 8;
                cmd.Parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.VarChar)).Value = "";
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjNews.CreatedBy = Convert.ToString(rdr["CreatedBy"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();

                return lstNews.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }





    //added by khalid 10-1-13
    //updated by khalid 15-13

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<News> GetNews_NewsChannelSchoolUserIdWise(int intChannelId, int SchoolId, int SchoolUserId)
    {
        try
        {
            List<News> lstNews = new List<News>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ChannelId", SqlDbType.Int)).Value = intChannelId;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 16;
                cmd.Parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.VarChar)).Value = "";
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.Int)).Value = SchoolUserId;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjNews.CreatedBy = Convert.ToString(rdr["CreatedBy"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();

                return lstNews.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    
    
    
    

    [WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    public List<News> GetNews_SchoolIdWise(int SchoolId)
    {
        try
        {
            List<News> lstNews = new List<News>();

            // 
            //{
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 4;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();
                return lstNews.ToList();
            //}
            //else
            //{
            //    return lstNews.ToList();
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    //commented by khalid 10-1-13
    //uncommented by khalid 15-1-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<News> GetNews_NewsSchoolWise(int SchoolId)
    {
        try
        {
            List<News> lstNews = new List<News>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 9;
                cmd.Parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.VarChar)).Value = "";
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjNews.CreatedBy = Convert.ToString(rdr["CreatedBy"]);
                    ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();

                return lstNews;
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    
    //added by khalid 10-1-13
    //updated by khalid 15-1-13
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<News> GetNews_NewsSchoolUserIdWise(int SchoolId, int SchoolUserId)
    {
        try
        {
            List<News> lstNews = new List<News>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 16;
                cmd.Parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.VarChar)).Value = "";
                cmd.Parameters.Add(new SqlParameter("@SchoolUserId", SqlDbType.VarChar)).Value = SchoolUserId;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    ObjNews.CreatedBy = Convert.ToString(rdr["CreatedBy"]);
                    ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();

                return lstNews;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
        


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<News> GetClassNews_ClassIdWise(int ClassId)
    {
        try
        {
            List<News> lstNews = new List<News>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ClassId", SqlDbType.Int)).Value = ClassId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 10;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();

                return lstNews;
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<News> GetAllClassesNews_SchoolIdWise(int SchoolId)
    {
        try
        {
            List<News> lstNews = new List<News>();
           
             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 15;
                cmd.Parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.VarChar)).Value = "";
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();

                return lstNews;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

   
    
    [WebMethod]
    //[SoapHeader("CustomSoapHeader")]
    public List<News> GetAllNews()
    {
        try
        {
            List<News> lstNews = new List<News>();

            // 
            //{
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 5;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.ChannelId = Convert.ToInt32(rdr["ChannelId"]);
                    ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();
                return lstNews.ToList();
            //}
            //else
            //{
            //    return lstNews.ToList();
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //News Searching
    

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<News> GetNews_SearchingHeadingWise(int SchoolId, string NewsHeading)
    {
        try
        {
            List<News> lstNews = new List<News>();

             
            
            SqlConnection sqlConnection = new SqlConnection(cnnString);
            SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
            cmd.Parameters.Add(new SqlParameter("@NewsHeading", SqlDbType.VarChar)).Value = NewsHeading;
            cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 7;
            sqlConnection.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                News ObjNews = new News();
                ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                {
                    ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                }
                lstNews.Add(ObjNews);
            }
            sqlConnection.Close();
            return lstNews.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<News> GetNews_SearchingDescriptionWise(int SchoolId, string NewsDescrption)
    {
        try
        {
            List<News> lstNews = new List<News>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@NewsDescription", SqlDbType.VarChar)).Value = NewsDescrption;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 13;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();
                return lstNews.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<News> GetNews_SearchingDateWise(int SchoolId, DateTime datetime)
    {
        try
        {
            List<News> lstNews = new List<News>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_News", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@CreatedDate", SqlDbType.DateTime)).Value = Convert.ToDateTime(datetime).ToString("MM/dd/yyyy");
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 14;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    News ObjNews = new News();
                    ObjNews.NewsId = Convert.ToInt32(rdr["NewsId"]);
                    ObjNews.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjNews.ChannelName = Convert.ToString(rdr["ChannelName"]);
                    ObjNews.NewsHeading = Convert.ToString(rdr["NewsHeading"]);
                    ObjNews.NewsDescription = Convert.ToString(rdr["NewsDescription"]);
                    ObjNews.NewsStatus = Convert.ToString(rdr["NewsStatus"]);
                    ObjNews.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjNews.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstNews.Add(ObjNews);
                }
                sqlConnection.Close();
                return lstNews.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    
  

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Share> GetShare_ShareIdWise(int intShareId)
    {
        try
        {
            List<Share> lstShare = new List<Share>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Share", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ShareId", SqlDbType.Int)).Value = intShareId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Share ObjShare = new Share();
                    ObjShare.ShareId = Convert.ToInt32(rdr["ShareId"]);
                    ObjShare.MyName = Convert.ToString(rdr["MyName"]);
                    ObjShare.MyEmail = Convert.ToString(rdr["MyEmail"]);
                    ObjShare.FriendName = Convert.ToString(rdr["FriendName"]);
                    ObjShare.FriendEmail = Convert.ToString(rdr["FriendEmail"]);
                    ObjShare.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjShare.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstShare.Add(ObjShare);
                }
                sqlConnection.Close();
                return lstShare.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Share> GetAllShare()
    {
        try
        {
            List<Share> lstShare = new List<Share>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Share", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 4;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Share ObjShare = new Share();
                    ObjShare.ShareId = Convert.ToInt32(rdr["ShareId"]);
                    ObjShare.MyName = Convert.ToString(rdr["MyName"]);
                    ObjShare.MyEmail = Convert.ToString(rdr["MyEmail"]);
                    ObjShare.FriendName = Convert.ToString(rdr["FriendName"]);
                    ObjShare.FriendEmail = Convert.ToString(rdr["FriendEmail"]);
                    ObjShare.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjShare.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstShare.Add(ObjShare);
                }
                sqlConnection.Close();
                return lstShare.ToList();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Class> GetClass_SchoolIdWise(int SchoolId)
    {
        try
        {
            IList<Class> lstClass = new List<Class>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Class", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 3;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Class ObjClass = new Class();
                    ObjClass.ClassId = Convert.ToInt32(rdr["ClassId"]);
                    ObjClass.ClassTitle = Convert.ToString(rdr["ClassTitle"]);
                    ObjClass.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjClass.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjClass.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    lstClass.Add(ObjClass);
                }
                sqlConnection.Close();
                return lstClass.ToList();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Teacher> GetAllTeacher_ClassIdWise(int ClassId)
    {
        try
        {
            List<Teacher> lstNews = new List<Teacher>();

             
           
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_AssignClasses", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@ClassId", SqlDbType.Int)).Value = ClassId;
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 8;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Teacher ObjTeachers = new Teacher();
                    ObjTeachers.TeacherId = Convert.ToInt32(rdr["TeacherId"]);
                    ObjTeachers.TeacherName = Convert.ToString(rdr["TeacherName"]);
                    ObjTeachers.TeacherEmail = Convert.ToString(rdr["TeacherEmaill"]);
                    lstNews.Add(ObjTeachers);
                }
                sqlConnection.Close();

                return lstNews;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Messages> GetAllMessages_SchoolIdWise_And_ParentIdWise(int SchoolId, int ParentId)
    {
        try
        {
            List<Messages> lstMessages = new List<Messages>();

             
             SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Messages", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 1;
                cmd.Parameters.Add(new SqlParameter("@ParentID", SqlDbType.Int)).Value = ParentId;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Messages ObjMessages = new Messages();

                    if (Convert.ToString(rdr["Deleted"]) != "Parent" && Convert.ToString(rdr["Deleted"]) != "Both")
                    {
                        if (!Convert.IsDBNull(rdr["Deleted"]))
                        {
                            ObjMessages.Deleted = Convert.ToString(rdr["Deleted"]);
                        }
                        ObjMessages.MessageID = Convert.ToInt32(rdr["MessageID"]);
                        ObjMessages.ParentID = Convert.ToInt32(rdr["ParentID"]);
                        if (!Convert.IsDBNull(rdr["StudentID"]))
                        {
                            ObjMessages.StudentID = Convert.ToInt32(rdr["StudentID"]);
                        }
                        ObjMessages.TeacherID = Convert.ToInt32(rdr["TeacherID"]);

                        if (!Convert.IsDBNull(rdr["ClassId"]))
                        {
                            ObjMessages.ClassId = Convert.ToInt32(rdr["ClassId"]);
                        }
                        ObjMessages.ParentName = Convert.ToString(rdr["ParentName"]);
                        ObjMessages.TeacherName = Convert.ToString(rdr["TeacherName"]);
                        ObjMessages.ParentMessage = Convert.ToString(rdr["ParentMessage"]);
                        ObjMessages.ParentReply = Convert.ToString(rdr["ParentReply"]);
                        ObjMessages.TeacherMessage = Convert.ToString(rdr["TeacherMessage"]);
                        ObjMessages.TeacherReply = Convert.ToString(rdr["TeacherReply"]);
                        ObjMessages.Sender = Convert.ToString(rdr["Sender"]);
                        if (!Convert.IsDBNull(rdr["SendMessageDate"]))
                        {
                            ObjMessages.SendMessageDate = Convert.ToDateTime(rdr["SendMessageDate"]);
                        }
                        if (!Convert.IsDBNull(rdr["ReplyMessageDate"]))
                        {
                            ObjMessages.ReplyMessageDate = Convert.ToDateTime(rdr["ReplyMessageDate"]);
                        }
                        lstMessages.Add(ObjMessages);
                    }
                }
                sqlConnection.Close();

                return lstMessages;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Messages> GetAllMessages_MessageIdWise(int MessageID)
    {
        try
        {
            List<Messages> lstMessages = new List<Messages>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Messages", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 3;
                cmd.Parameters.Add(new SqlParameter("@MessageID", SqlDbType.Int)).Value = MessageID;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Messages ObjMessages = new Messages();
                    ObjMessages.MessageID = Convert.ToInt32(rdr["MessageID"]);
                    ObjMessages.ParentID = Convert.ToInt32(rdr["ParentID"]);
                    if (!Convert.IsDBNull(rdr["StudentID"]))
                    {
                        ObjMessages.StudentID = Convert.ToInt32(rdr["StudentID"]);
                    }
                    ObjMessages.TeacherID = Convert.ToInt32(rdr["TeacherID"]);
                    if (!Convert.IsDBNull(rdr["Deleted"]))
                    {
                        ObjMessages.Deleted = Convert.ToString(rdr["Deleted"]);
                    }
                    if (!Convert.IsDBNull(rdr["ClassId"]))
                    {
                        ObjMessages.ClassId = Convert.ToInt32(rdr["ClassId"]);
                    }
                    ObjMessages.ParentMessage = Convert.ToString(rdr["ParentMessage"]);
                    ObjMessages.ParentReply = Convert.ToString(rdr["ParentReply"]);
                    ObjMessages.TeacherMessage = Convert.ToString(rdr["TeacherMessage"]);
                    ObjMessages.TeacherReply = Convert.ToString(rdr["TeacherReply"]);
                    ObjMessages.Sender = Convert.ToString(rdr["Sender"]);
                    if (!Convert.IsDBNull(rdr["SendMessageDate"]))
                    {
                        ObjMessages.SendMessageDate = Convert.ToDateTime(rdr["SendMessageDate"]);
                    }
                    if (!Convert.IsDBNull(rdr["ReplyMessageDate"]))
                    {
                        ObjMessages.ReplyMessageDate = Convert.ToDateTime(rdr["ReplyMessageDate"]);
                    }
                    lstMessages.Add(ObjMessages);
                }
                sqlConnection.Close();

                return lstMessages;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Parents> Parent_Login(int SchoolId, string ParentEmail, string ParentPassword)
    {
        try
        {
            List<Parents> listParents = new List<Parents>();

             
              SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Parent", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 12;
                cmd.Parameters.Add(new SqlParameter("@ParentEmail", SqlDbType.VarChar)).Value = ParentEmail;
                cmd.Parameters.Add(new SqlParameter("@ParentPassword", SqlDbType.VarChar)).Value = ParentPassword;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                
                
                while (rdr.Read())
                {
                    Parents ObjParents = new Parents();
                    ObjParents.ParentId = Convert.ToInt32(rdr["ParentId"]);
                    ObjParents.ParentName = Convert.ToString(rdr["ParentName"]);
                    ObjParents.ParentPhoneNo = Convert.ToString(rdr["ParentPhoneNo"]);
                    ObjParents.ParentGuid = Convert.ToString(rdr["ParentGuid"]);
                    ObjParents.ParentCode = Convert.ToString(rdr["ParentCode"]);
                    ObjParents.ParentAddress = Convert.ToString(rdr["ParentAddress"]);
                    listParents.Add(ObjParents);
                }
                sqlConnection.Close();

                return listParents;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Status> Insert_Parent_Personal_Message(int SchoolId, int ClassId, int TeacherId, int ParentId, string PersonalMessage)
    {
        try
        {
            List<Status> listStatus = new List<Status>();


             
            
                Status objStatus = new Status();
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Messages", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 2;
                cmd.Parameters.Add(new SqlParameter("@ParentID", SqlDbType.Int)).Value = ParentId;
                cmd.Parameters.Add(new SqlParameter("@TeacherID", SqlDbType.Int)).Value = TeacherId;
                cmd.Parameters.Add(new SqlParameter("@ParentMessage", SqlDbType.VarChar)).Value = PersonalMessage;
                cmd.Parameters.Add(new SqlParameter("@Sender", SqlDbType.VarChar)).Value = "Parent";
                cmd.Parameters.Add(new SqlParameter("@Receiver", SqlDbType.VarChar)).Value = "Teacher";
                cmd.Parameters.Add(new SqlParameter("@ClassId", SqlDbType.Int)).Value = ClassId;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                sqlConnection.Open();
                objStatus.StatusMessage = cmd.ExecuteNonQuery();
                listStatus.Add(objStatus);
                sqlConnection.Close();
                return listStatus;
           
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Contact> Search_Contact(int SchoolId, string StaffName, string EmailAddress, string PhoneNo)
    {
        try
        {
            List<Contact> listContacts = new List<Contact>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Contact", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 7;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                if (StaffName != "")
                {
                    cmd.Parameters.Add(new SqlParameter("@StaffName", SqlDbType.VarChar)).Value = StaffName;
                }
                else if (EmailAddress != "")
                {
                    cmd.Parameters.Add(new SqlParameter("@EmailAddress", SqlDbType.VarChar)).Value = EmailAddress;
                }
                else if (PhoneNo != "")
                {
                    cmd.Parameters.Add(new SqlParameter("@PhoneNo", SqlDbType.VarChar)).Value = PhoneNo;
                }
                
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Contact ObjContact = new Contact();
                    ObjContact.ContactId = Convert.ToInt32(rdr["ContactId"]);
                    ObjContact.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjContact.StaffName = Convert.ToString(rdr["StaffName"]);
                    ObjContact.Address = Convert.ToString(rdr["Address"]);
                    ObjContact.PhoneNo = Convert.ToString(rdr["PhoneNo"]);
                    ObjContact.EmailAddress = Convert.ToString(rdr["EmailAddress"]);
                    ObjContact.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);

                    if (!Convert.IsDBNull(rdr["UpdatedDate"]))
                    {
                        ObjContact.UpdatedDate = Convert.ToDateTime(rdr["UpdatedDate"]);
                    }
                    listContacts.Add(ObjContact);
                }
                sqlConnection.Close();

                return listContacts;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Status> Update_Parent_Personal_Message(int MessageId, string ParentReply)
    {
        try
        {
            List<Status> listStatus = new List<Status>();


             
            
                Status objStatus = new Status();
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Messages", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 5;
                cmd.Parameters.Add(new SqlParameter("@MessageID", SqlDbType.VarChar)).Value = MessageId;
                cmd.Parameters.Add(new SqlParameter("@ParentReply", SqlDbType.VarChar)).Value = ParentReply;
                sqlConnection.Open();
                objStatus.StatusMessage = cmd.ExecuteNonQuery();
                listStatus.Add(objStatus);
                sqlConnection.Close();
                return listStatus;
            

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Status> Delete_Parent_Personal_Message(int MessageId, string DeletedPerson)
    {
        try
        {
            List<Status> listStatus = new List<Status>();


             
           
                Status objStatus = new Status();
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Messages", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 8;
                cmd.Parameters.Add(new SqlParameter("@MessageID", SqlDbType.VarChar)).Value = MessageId;
                cmd.Parameters.Add(new SqlParameter("@Deleted", SqlDbType.VarChar)).Value = DeletedPerson;
                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                objStatus.StatusMessage = 1;
                listStatus.Add(objStatus);
                sqlConnection.Close();
                return listStatus;
            

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Student> Student_Login(int SchoolId, string StudentEmail, string StudentPassword)
    {
        try
        {
            List<Student> listStudents = new List<Student>();

             
            
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Student", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationId", SqlDbType.Int)).Value = 17;
                cmd.Parameters.Add(new SqlParameter("@StudentEmail", SqlDbType.VarChar)).Value = StudentEmail;
                cmd.Parameters.Add(new SqlParameter("@StudentPassword", SqlDbType.VarChar)).Value = StudentPassword;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                sqlConnection.Open();
                SqlDataReader rdr = cmd.ExecuteReader();


                while (rdr.Read())
                {
                    Student ObjStudent = new Student();
                    ObjStudent.StudentId = Convert.ToInt32(rdr["StudentId"]);
                    ObjStudent.StudentFirstName = Convert.ToString(rdr["StudentFirstName"]);
                    ObjStudent.StudentLastName = Convert.ToString(rdr["StudentLastName"]);
                    ObjStudent.StudentNo = Convert.ToString(rdr["StudentNo"]);
                    ObjStudent.StudentAddress = Convert.ToString(rdr["StudentAddress"]);
                    ObjStudent.StudentEmail = Convert.ToString(rdr["StudentEmail"]);
                    ObjStudent.SchoolId = Convert.ToInt32(rdr["SchoolId"]);
                    ObjStudent.ParentId = Convert.ToInt32(rdr["ParentId"]);
                    ObjStudent.ClassId = Convert.ToInt32(rdr["ClassId"]);
                    listStudents.Add(ObjStudent);
                }
                sqlConnection.Close();

                return listStudents;
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    #region ===Create Topic===
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public List<Status> Forum_Create_Topic(int StudentId, int ClassId, int SchoolId, string Subject, string Description)
    {
        try
        {
            List<Status> listStatus = new List<Status>();


             
            
                Status objStatus = new Status();
                SqlConnection sqlConnection = new SqlConnection(cnnString);
                SqlCommand cmd = new SqlCommand("sp_Forum", sqlConnection) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new SqlParameter("@OperationID", SqlDbType.Int)).Value = 1;
                cmd.Parameters.Add(new SqlParameter("@StudentId", SqlDbType.Int)).Value = StudentId;
                cmd.Parameters.Add(new SqlParameter("@ClassId", SqlDbType.Int)).Value = ClassId;
                cmd.Parameters.Add(new SqlParameter("@SchoolId", SqlDbType.Int)).Value = SchoolId;
                cmd.Parameters.Add(new SqlParameter("@Subject", SqlDbType.VarChar)).Value = Subject;
                cmd.Parameters.Add(new SqlParameter("@Description", SqlDbType.VarChar)).Value = Description;
                sqlConnection.Open();
                objStatus.StatusMessage = cmd.ExecuteNonQuery();
                listStatus.Add(objStatus);
                sqlConnection.Close();
                return listStatus;
            

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    #endregion
   
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public void SendEmail(string emailid, string messageBody, string SubjectMail)
    {
        #region Eamil

         
        
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            client.EnableSsl = true;
            client.Host = "smtp.gmail.com";
            client.Port = 587;                 // setup Smtp authentication             
            String email = System.Configuration.ConfigurationManager.AppSettings["email"].ToString();
            String password = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(email, password);
            client.UseDefaultCredentials = false;
            client.Credentials = credentials;
            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            msg.From = new System.Net.Mail.MailAddress(System.Configuration.ConfigurationManager.AppSettings["emailadmin"].ToString());
            msg.To.Add(new System.Net.Mail.MailAddress(emailid));
            msg.Subject = SubjectMail;
            msg.IsBodyHtml = true;
            msg.Body = messageBody;
            object userState = msg;
            try
            {
                client.SendAsync(msg, userState);
            }
            catch (Exception ex)
            {
                
            }
        
        
        #endregion
        
    }
    
    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public string Decrypt(string text)
    {
        try
        {
            text = text.Replace(" ", "+");
            key = System.Text.Encoding.UTF8.GetBytes(stringKey.Substring(0, 8));
            System.Security.Cryptography.DESCryptoServiceProvider des = new System.Security.Cryptography.DESCryptoServiceProvider();
            Byte[] byteArray = Convert.FromBase64String(text);
            System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, des.CreateDecryptor(key, IV), System.Security.Cryptography.CryptoStreamMode.Write);
            cryptoStream.Write(byteArray, 0, byteArray.Length);
            cryptoStream.FlushFinalBlock();
            return System.Text.Encoding.UTF8.GetString(memoryStream.ToArray());
        }
        catch (Exception ex)
        {
            // Handle Exception Here
            throw ex;
        }
        return string.Empty;
    }

    [WebMethod]
    [SoapHeader("CustomSoapHeader")]
    public string Encrypt(string text)
    {
        try
        {
            key = System.Text.Encoding.UTF8.GetBytes(stringKey.Substring(0, 8));
            System.Security.Cryptography.DESCryptoServiceProvider des = new System.Security.Cryptography.DESCryptoServiceProvider();
            Byte[] byteArray = System.Text.Encoding.UTF8.GetBytes(text);
            System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, des.CreateEncryptor(key, IV), System.Security.Cryptography.CryptoStreamMode.Write);
            cryptoStream.Write(byteArray, 0, byteArray.Length);
            cryptoStream.FlushFinalBlock();
            string a = Convert.ToBase64String(memoryStream.ToArray());
            return Convert.ToBase64String(memoryStream.ToArray());
        }
        catch (Exception)
        {
            // Handle Exception Here
        }
        return string.Empty;
    }
    
    

}

