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
	

/*	
	public void updateSign(String photoNo) {
		photoDAO.deletePhoto(photoNo);
	}
*/
	public void registerSign(EmployeeVO employee) {
		
		String empNo = employee.getEmpNo();
		logger.info("empNo : {}", empNo);
		
		List<PhotoVO> photos = employee.getPhotos();
		logger.info("photos : {}", photos);
		if(photos.size() != 0) {
			for(PhotoVO photo : photos) {
				photo.setEmpNo(empNo);
			}
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("photos", photos);
			photoDAO.insertSign(map1);
		}
	}
	
	public String checkSignCount(String empNo) {
		return photoDAO.checkSign(empNo);
	}
	
	public EmployeeVO retrieveEmployee(String empNo) {
		return employeeDAO.selectEmployee(empNo);
	}

	public List<EmployeeVO> retrieveEmployeeList(Map<String, Object> map) {
		return employeeDAO.selectEmployeeList(map);
	}
	
	public List<EmployeeVO> retrieveEmployeeNameAndDutyList() {
		return employeeDAO.selectEmployeeNameAndDutyList();
	}

	public void registerEmployee(EmployeeVO employee) {
		
		String empNo = employeeDAO.insertEmployee(employee);
		logger.info("empNo : {}", empNo);
		
		List<EmployeeCodeVO> codeList = employee.getCodeList();
		for(EmployeeCodeVO code : codeList) { 
			code.setEmpNo(empNo);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("codeList", codeList);
		
		employeeDAO.insertEmployeeCode(map);
		
		List<PhotoVO> photos = employee.getPhotos();
		logger.info("photos : {}", photos);
		if(photos.size() != 0) {
			for(PhotoVO photo : photos) {
				photo.setEmpNo(empNo);
			}
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("photos", photos);
			photoDAO.insertPhoto(map1);
		}
	}
	
	public void modifyEmployee(EmployeeVO employee) {
		String empNo = employeeDAO.updateEmployee(employee);
	}
	
	public void modifyEmployeeAdmin(EmployeeVO employee) {
		String empNo = employeeDAO.updateEmployee(employee);
	
		List<EmployeeCodeVO> codeList = employee.getCodeList();
		
		employeeDAO.deleteEmployeeCode(empNo);		
		for(EmployeeCodeVO code : codeList) { 
			code.setEmpNo(empNo);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("codeList", codeList);
		employeeDAO.insertEmployeeCode(map);
		
		List<PhotoVO> photos = employee.getPhotos();
		if(photos.size() != 0) {
			photoDAO.deletePhoto(empNo);
			for(PhotoVO photo : photos) {
				photo.setEmpNo(empNo);
			}
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("photos", photos);
			photoDAO.insertPhoto(map1);
		}
	}
	
	public void retireEmployee(String empNo) {
		employeeDAO.retireEmployee(empNo);
	}
	
	public void registerDeputy(DeputyVO deputy) {
		deputyDAO.insertDeputy(deputy);
	}

	public List<DeputyVO> retrieveDeputyList(Map<String, Object> map) {
		return deputyDAO.selectDeputyList(map);
	}
	
	public int retrieveDeputyListCount(Map<String, Object> map) {
		return deputyDAO.selectDeputyListCount(map);
	}
	
	public int retrieveEmployeeCount(Map<String, Object> map) {
		return employeeDAO.selectEmployeeCount(map);
	}
	
	public List<EmployeeVO> retrieveDeputyRegisterEmployeeList(Map<String, Object> map) {
		return deputyDAO.selectDeputyRegisterEmployeeList(map);
	}
	
	public int retrieveDeputyRegisterCount(Map<String, Object> map) {
		return deputyDAO.selectDeputyRegisterCount(map);
	}

}
