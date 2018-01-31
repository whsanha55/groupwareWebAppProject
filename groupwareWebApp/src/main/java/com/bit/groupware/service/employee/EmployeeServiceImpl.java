package com.bit.groupware.service.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeCodeViewVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.persistent.employee.DeputyDAO;
import com.bit.groupware.persistent.employee.EmployeeDAO;
import com.bit.groupware.persistent.employee.PhotoDAO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);
	
	@Autowired
	private EmployeeDAO employeeDAO;
	@Autowired
	private DeputyDAO deputyDAO;
	@Autowired
	private PhotoDAO photoDAO;
	

/*	public EmployeeVO retrieveEmployee(String empNo) {
		return employeeDAO.selectEmployee(empNo);


	public List<EmployeeVO> retrieveEmployeeList(Map<String, Object> map) {
		return employeeDAO.selectEmployeeList(map);
	}

	public void modifyEmployee(EmployeeVO employee) {
		employeeDAO.updateEmployee(employee);
	}

	public int checkDeptEmployee(String cNo) {
		return employeeDAO.checkDeptEmp(cNo);
	}

	public void removePhoto(String photoNo) {
		photoDAO.deletePhoto(photoNo);
	}
*/
	public List<EmployeeCodeViewVO> retrieveEmployeeList(Map<String, Object> map) {
		return employeeDAO.selectEmployeeList(map);
	}
	
	public void registerEmployee(EmployeeVO employee, EmployeeCodeVO empcode) {
		String empNo = employeeDAO.insertEmployee(employee);
		logger.info("empNo : {}", empNo);
		
		employeeDAO.insertEmployeeCode(empcode);
		logger.info("empCode1 : {}", empcode);
		
		employeeDAO.insertEmployeeCode(empcode);
		logger.info("empCode2 : {}", empcode);
		
		List<PhotoVO> photos = employee.getPhotos();
		if(photos.size() != 0) {
			for(PhotoVO photo : photos) {
				photo.setEmpNo(empNo);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("photos", photos);
			photoDAO.insertPhoto(map);
		}
	}
	
	public void registerDeputy(DeputyVO deputy) {
		deputyDAO.insertDeputy(deputy);
	}

	public List<DeputyVO> retrieveDeputyList(Map<String, Object> map) {
		return deputyDAO.selectDeputyList(map);
	}

}
