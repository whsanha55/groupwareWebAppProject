package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.TemplateVO;

public interface TemplateService {

   //양식서 목록 검색
   List<TemplateVO> retrieveTemplateList(Map<String, Object> map);
   
   //번호에 해당하는 양식서 조회
   TemplateVO retrieveTemplate(int tmpNo);
   
   //양식 추가
   void registerTemplate(TemplateVO templateVO);
   
   //양식 삭제
   void removeTemplate(List<Integer> tempNos);
   
   
}