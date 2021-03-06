package com.lube.user.service;

import com.lube.user.entity.Menu;
import com.lube.user.entity.User;
import com.lube.utils.LogisticsException;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-3-31
 * Time: 下午9:58
 * To change this template use File | Settings | File Templates.
 */
public interface IUserService {

    /**
     * 校验用户登录信息的有效性
     * @param user
     * @return
     */
    User verifyLogin(User user) throws LogisticsException;

    List<User> queryAllUser(Map<String,String> params);
    int queryAllUserCount(Map<String, String> params);

    void addUser(Map<String,String> params) throws LogisticsException;

    /**
     * 检查用户名是否存在
     * @param userName
     */
    void checkUserName(String userName) throws LogisticsException;

    void deleteUser(String[] ids) throws LogisticsException;

    /**
     * 获取登录用户的所有菜单
     * @param id
     * @return
     */
    List<Menu> queryUserMenu(String id) throws LogisticsException;
}
