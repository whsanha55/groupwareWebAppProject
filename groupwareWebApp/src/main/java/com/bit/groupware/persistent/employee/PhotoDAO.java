package com.bit.groupware.persistent.employee;

import com.bit.groupware.domain.employee.PhotoVO;

public interface PhotoDAO {

	void insertPhoto(PhotoVO photo);
	
	void deletePhoto(String photoNo);
}
