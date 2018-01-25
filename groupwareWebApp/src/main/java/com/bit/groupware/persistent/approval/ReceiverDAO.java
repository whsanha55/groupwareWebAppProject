package com.bit.groupware.persistent.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverVO;

public interface ReceiverDAO {

	int insertReceiver(ReceiverVO receiver);

	List<ReceiverVO> selectReceiverList();

	void updateReceiver(ReceiverVO receiver);

	void deleteReceiver(int receiverNo);
}
