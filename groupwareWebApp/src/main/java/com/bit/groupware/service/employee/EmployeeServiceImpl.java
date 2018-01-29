package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.EmployeeCodeViewVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.persistent.employee.DeputyDAO;
import com.bit.groupware.persistent.employee.EmployeeDAO;
import com.bit.groupware.persistent.employee.PhotoDAO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDAO employeeDAO;
	@Autowired
	private DeputyDAO deputyDAO;
	@Autowired
	private PhotoDAO photoDAO;
	
/*	public EmployeeVO retrieveEmployee(String empNo) {
		return employeeDAO.selectEmployee(empNo);
	}

	public List<EmployeeVO> retrieveEmployeeList(Map<String, Object> map) {
		return employeeDAO.selectEmployeeList(map);
	}

	public void modifyEmployee(EmployeeVO employee) {
		employeeDAO.updateEmployee(employee);
	}

	public int checkDeptEmployee(String cNo) {
		return employeeDAO.checkDeptEmp(cNo);
	}

	public void registerPhoto(PhotoVO photo) {
		photoDAO.insertPhoto(photo);
	}

	public void removePhoto(String photoNo) {
		photoDAO.deletePhoto(photoNo);
	}

	public void registerDeputy(DeputyVO deputy) {
		deputyDAO.insertDeputy(deputy);
	}

	public List<DeputyVO> retrieveDeputyList(Map<String, Object> map) {
		return deputyDAO.selectDeputyList(map);
	}
*/
	public List<EmployeeCodeViewVO> retrieveEmployeeList(Map<String, Object> map) {
		return employeeDAO.selectEmployeeList(map);
	}
	
	public void registerEmployee(EmployeeVO employee) {
		String empNo = employeeDAO.insertEmployee(employee);
		employeeDAO.insertEmployeeCode(empNo);
	}

}
