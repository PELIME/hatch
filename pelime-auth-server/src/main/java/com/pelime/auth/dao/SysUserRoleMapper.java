package com.pelime.auth.dao;

import com.pelime.auth.entity.SysRole;
import com.pelime.auth.entity.SysUser;

import java.util.List;

public interface SysUserRoleMapper {
    List<SysUser> getUsersByRoleId(int rileId);
    List<SysRole> getRolesByUserId(int userId);
}
