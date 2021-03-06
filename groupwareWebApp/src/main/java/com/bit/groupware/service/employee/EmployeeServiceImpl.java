package com.bit.groupware.service.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.DepartmentVO;
import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.persistent.employee.DepartmentDAO;
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
	@Autowired
	private DepartmentDAO departmentDAO;
	

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
	
	public void modifySign(EmployeeVO employee) {		
		String empNo = employee.getEmpNo();
		logger.info("empNo : {}", empNo);
		
		List<PhotoVO> photos = employee.getPhotos();
		logger.info("photos : {}", photos);
		if(photos.size() != 0) {
			photoDAO.deleteSign(empNo);
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
		
		employeeDAO.insertAuthority(empNo);
	}
	
	public void modifyEmployee(EmployeeVO employee) {
		String empNo = employeeDAO.updateEmployee(employee);
	}
	
	public void modifyEmployeeAdmin(Map<String, Object> map) {
		
		EmployeeVO employee = (EmployeeVO)map.get("employee");
		
		String empNo = employeeDAO.updateEmployee(employee);
		
		Map<String, Object> procMap = new HashMap<String, Object>();
		procMap.put("empNo", empNo);
		procMap.put("oldDuty", map.get("oldDuty"));
		procMap.put("oldDept", map.get("oldDept"));
		logger.info("procMap : {}", procMap);
		
		
		List<EmployeeCodeVO> codeList = employee.getCodeList();
		if(!(codeList.get(0).getcNo().equals((String)map.get("oldDept")) && codeList.get(1).getcNo().equals((String)map.get("oldDuty")))) {
			employeeDAO.insertCodeHistoryProcedure(procMap);
		}
		employeeDAO.deleteEmployeeCode(empNo);
		for(EmployeeCodeVO code : codeList) { 
			code.setEmpNo(empNo);
		}
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("codeList", codeList);
		employeeDAO.insertEmployeeCode(map1);
		
		List<PhotoVO> photos = employee.getPhotos();
		if(photos.size() != 0) {
			photoDAO.deletePhoto(empNo);
			for(PhotoVO photo : photos) {
				photo.setEmpNo(empNo);
			}
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("photos", photos);
			photoDAO.insertPhoto(map2);
		}
		
	}
	
	public void retireEmployee(String empNo) {
		employeeDAO.retireEmployee(empNo);
		employeeDAO.deleteAuthority(empNo);
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
	
	public List<DepartmentVO> retrieveDeptList(Map<String, Object> map) {
		return departmentDAO.selectDeptList(map);
	}
	
	public Map<String, Object> retrieveDeptInfo(String cNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		DepartmentVO department = departmentDAO.selectDeptCharge(cNo);
		map.put("department", department);
		map.put("memberCount", departmentDAO.selectDeptEmp(cNo));
		map.put("teamCount", departmentDAO.selectDeptTeam(cNo));
		return map;
	}
	
	public List<EmployeeVO> retrieveMemberDetail(String cNo) {
		return departmentDAO.selectDeptEmpDetail(cNo);
	}

	public void modifyHead(Map<String, Object> map) {
		departmentDAO.retireHead((String)map.get("oldHead"));
		departmentDAO.updateHead((String)map.get("newHead"));		
	}
	
	public void removeDeputy(String depNo) {
		deputyDAO.deleteDeputy(depNo);
	}
	
	public void stopUseDeputy(Map<String, Object> map) {
		deputyDAO.stopUseDeputy(map); 
	}
	
	public int retrieveDeputyCheck(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return deputyDAO.selectDeputyCheck(map);
 	}

	public void removeSign(String empNo) {
		photoDAO.deleteSign(empNo);
	}

}
