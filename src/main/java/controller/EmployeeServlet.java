package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Dao.EmployeeDao;
import Entity.Employee;
import utility.DbConnection;


@WebServlet("/abc")
@MultipartConfig(maxFileSize=1024*1024*2)
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//informing to browser ,we r sending html type text
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				String event=request.getParameter("event");
				
				if(event.equals("addEmployee")) {			
					 String name = request.getParameter("aaa");
					 String email= request.getParameter("email");
					 String password=request.getParameter("pass");
					 //image Start
					    Part p1=request.getPart("img");
						String Path=DbConnection.Path1();
						
				        String appPath =Path+"/EmpImg";
				        String imagePath = appPath + "";
				        File fileDir = new File(imagePath);
				        if (!fileDir.exists()) 
				                 fileDir.mkdirs();
				      //Get Image Name
				        String imageName1 = p1.getSubmittedFileName();
				        String fileExt1 = imageName1.substring(imageName1.length()-3);
				        String imgname1=new Date().getTime() +"1"+"."+fileExt1;
				        
				        String finalImgPath1="EmpImg" + "/"+ imgname1;
				
						        if(validateImage1(imageName1)){
						            try{
						                p1.write(imagePath + "/" + imgname1);
						            }catch (Exception ex) { }
						        }else{ out.print("<script> alert('Invalid Image Format')</script>");  }
					 //Image End
					 Employee e=new Employee();
					 e.setEmpEmail(email);
					 e.setEmpName(name);
					 e.setEmpPass(password);
					 e.setEmpImg(imgname1);
					 
					 EmployeeDao ed=new EmployeeDao();
					 int status=ed.saveEmployee(e);
					 out.print(status);
				}
				else if(event.equals("viewEmployee")) {
					
						EmployeeDao ed=new EmployeeDao();
						List<Employee> empList=ed.getAllEmployee();				
						GsonBuilder gsonbuilder=new GsonBuilder();
						Gson gson=gsonbuilder.create();
						String jsonObject=gson.toJson(empList);
						out.print(jsonObject);	
						
				}
						else if(event.equals("deleteEmployee")) {
					
						int empid=Integer.parseInt(request.getParameter("empid"));
						EmployeeDao ed=new EmployeeDao();
						int status=ed.deleteEmployee(empid);
						//System.out.println(status);
						out.print(status);
				}
						else if(event.equals("getEmpDetailsById")) {
							int empid=Integer.parseInt(request.getParameter("empid"));
							EmployeeDao ed=new EmployeeDao();
							List<Employee> emp=ed.fatchEmpById(empid);
							GsonBuilder gsonbuilder=new GsonBuilder();
							Gson gson=gsonbuilder.create();
							String jsonObject=gson.toJson(emp);
							out.print(jsonObject);
						}
						else if(event.equals("updateEmployee")) {
							 int empid=Integer.parseInt(request.getParameter("empid"));
							 String empName = request.getParameter("empName");
							 String empEmail= request.getParameter("empEmail");
							 String empPass=request.getParameter("empPass");
							 
							 Employee emp=new Employee();
							 emp.setEmpEmail(empEmail);
							 emp.setEmpid(empid);
							 emp.setEmpName(empName);
							 emp.setEmpPass(empPass);
							 
							EmployeeDao ed=new EmployeeDao();
							ed.updateEmployee(emp);
							response.sendRedirect("viewEmployee.jsp");
						}
					}//post
					private boolean validateImage1(String imageName1){
					      String fileExt1 = imageName1.substring(imageName1.length()-3);
					      if("jpg".equals(fileExt1) || "png".equals(fileExt1) || "gif".equals(fileExt1))
					      { 
					    	  return true;
					      }
					      return false;
					    }

				}