package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.TemplateVO;

public interface TemplateService {

   //��ļ� ��� �˻�
   List<TemplateVO> retrieveTemplateList(Map<String, Object> map);
   
   //��ȣ�� �ش��ϴ� ��ļ� ��ȸ
   TemplateVO retrieveTemplate(int tmpNo);
   
   //��� �߰�
   void registerTemplate(TemplateVO templateVO);
   
   //��� ����
   void removeTemplate(List<Integer> tempNos);
   
   
}