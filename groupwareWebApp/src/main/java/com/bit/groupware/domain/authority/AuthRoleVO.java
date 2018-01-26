package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

public class AuthRoleVO {
   private int arNo;           //���� ���� ��ȣ
   private String rId;             //�� ���̵�
   private String aNo;          //���� ��ȣ
   
   private List<AuthorityVO> authorities = new ArrayList<AuthorityVO>();
   private List<RoleVO> roles = new ArrayList<RoleVO>();
   
   public AuthRoleVO() {
      super();
   }

   public int getArNo() {
      return arNo;
   }

   public void setArNo(int arNo) {
      this.arNo = arNo;
   }

   public String getrId() {
      return rId;
   }

   public void setrId(String rId) {
      this.rId = rId;
   }

   public String getaNo() {
      return aNo;
   }

   public void setaNo(String aNo) {
      this.aNo = aNo;
   }

   
   
   public List<AuthorityVO> getAuthorities() {
      return authorities;
   }

   public void setAuthorities(List<AuthorityVO> authorities) {
      this.authorities = authorities;
   }

   public List<RoleVO> getRoles() {
      return roles;
   }

   public void setRoles(List<RoleVO> roles) {
      this.roles = roles;
   }

   @Override
   public String toString() {
      return "AuthRoleVO [arNo=" + arNo + ", rId=" + rId + ", aNo=" + aNo + ", authorities=" + authorities
            + ", roles=" + roles + "]";
   }

   
   
}