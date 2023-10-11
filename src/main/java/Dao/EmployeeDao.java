package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entity.Employee;
import utility.DbConnection;

public class EmployeeDao {
	
	//save Employee
		public int saveEmployee( Employee e) {
			int status=0;
			Connection con=DbConnection.getConn();
			String query="insert into Employee.emp(empName,empEmail,empPass,empImg) values(?,?,?,?)";
			try {
				//bridge establish
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, e.getEmpName());
				ps.setString(2, e.getEmpEmail());
				ps.setString(3, e.getEmpPass());
				ps.setString(4, e.getEmpImg());
				//it works like enter key
				status=ps.executeUpdate();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return status;
		}
		
		//view Employee
		public List<Employee> getAllEmployee(){
			ArrayList<Employee> empList=new ArrayList<>();
			Connection con=DbConnection.getConn();
			String query="SELECT empId,empName,empEmail,empPass,empImg FROM employee.emp";
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					Employee emp=new Employee();
					emp.setEmpid(rs.getInt(1));
					emp.setEmpName(rs.getString(2));
					emp.setEmpEmail(rs.getString(3));
					emp.setEmpPass(rs.getString(4));
					emp.setEmpImg(rs.getString(5));
					empList.add(emp);
				}
			}catch(Exception e) {
				e.getMessage();
			}
			return empList;
		}
		
		
		//Delete
		public int deleteEmployee(int empId) {
			int status=0;
			Connection con=DbConnection.getConn();
			String query="delete FROM employee.emp where empid=?";
			try {
				//bridge establish
				PreparedStatement ps=con.prepareStatement(query);
				ps.setInt(1, empId);
				
				status=ps.executeUpdate();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return status;
		}
		//fatch employee by employee Id
		
		public List<Employee> fatchEmpById(int empId) {
			ArrayList<Employee> emp=new ArrayList<>();
			
			Connection con=DbConnection.getConn();
			String query="SELECT empId,empName,empEmail,empPass FROM employee.emp where empId=?";
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ps.setInt(1, empId);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					Employee ob=new Employee();
					ob.setEmpid(rs.getInt(1));
					ob.setEmpName(rs.getString(2));
					ob.setEmpEmail(rs.getString(3));
					ob.setEmpPass(rs.getString(4));
					emp.add(ob);
				}
			}catch(Exception e) {
				e.getMessage();
			}
			return emp;
		}
		
		//Update
			public int updateEmployee(Employee emp) {
				int status=0;
				Connection con=DbConnection.getConn();
				String query="update employee.emp set empName=?,empEmail=?, empPass=? where empid=?";
				try {
					//bridge establish
					PreparedStatement ps=con.prepareStatement(query);
					ps.setString(1, emp.getEmpName());
					ps.setString(2, emp.getEmpEmail());
					ps.setString(3, emp.getEmpPass());
					ps.setInt(4, emp.getEmpid());
					
					status=ps.executeUpdate();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				return status;
			}
	}




