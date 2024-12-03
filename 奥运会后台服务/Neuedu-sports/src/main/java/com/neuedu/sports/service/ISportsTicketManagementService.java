package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsTicketManagement;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 门票与观众服务-门票管理Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsTicketManagementService extends IService<SportsTicketManagement>
{
    /**
     * 查询门票与观众服务-门票管理
     * 
     * @param id 门票与观众服务-门票管理主键
     * @return 门票与观众服务-门票管理
     */
    public SportsTicketManagement selectSportsTicketManagementById(Long id);

    /**
     * 查询门票与观众服务-门票管理列表
     * 
     * @param sportsTicketManagement 门票与观众服务-门票管理
     * @return 门票与观众服务-门票管理集合
     */
    public List<SportsTicketManagement> selectSportsTicketManagementList(SportsTicketManagement sportsTicketManagement);

    /**
     * 新增门票与观众服务-门票管理
     * 
     * @param sportsTicketManagement 门票与观众服务-门票管理
     * @return 结果
     */
    public int insertSportsTicketManagement(SportsTicketManagement sportsTicketManagement);

    /**
     * 修改门票与观众服务-门票管理
     * 
     * @param sportsTicketManagement 门票与观众服务-门票管理
     * @return 结果
     */
    public int updateSportsTicketManagement(SportsTicketManagement sportsTicketManagement);

    /**
     * 批量删除门票与观众服务-门票管理
     * 
     * @param ids 需要删除的门票与观众服务-门票管理主键集合
     * @return 结果
     */
    public int deleteSportsTicketManagementByIds(Long[] ids);

    /**
     * 删除门票与观众服务-门票管理信息
     * 
     * @param id 门票与观众服务-门票管理主键
     * @return 结果
     */
    public int deleteSportsTicketManagementById(Long id);
}
