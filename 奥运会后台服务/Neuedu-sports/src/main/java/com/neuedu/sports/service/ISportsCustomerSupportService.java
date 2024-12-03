package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsCustomerSupport;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 门票与观众服务-客服支持Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsCustomerSupportService extends IService<SportsCustomerSupport>
{
    /**
     * 查询门票与观众服务-客服支持
     * 
     * @param id 门票与观众服务-客服支持主键
     * @return 门票与观众服务-客服支持
     */
    public SportsCustomerSupport selectSportsCustomerSupportById(Long id);

    /**
     * 查询门票与观众服务-客服支持列表
     * 
     * @param sportsCustomerSupport 门票与观众服务-客服支持
     * @return 门票与观众服务-客服支持集合
     */
    public List<SportsCustomerSupport> selectSportsCustomerSupportList(SportsCustomerSupport sportsCustomerSupport);

    /**
     * 新增门票与观众服务-客服支持
     * 
     * @param sportsCustomerSupport 门票与观众服务-客服支持
     * @return 结果
     */
    public int insertSportsCustomerSupport(SportsCustomerSupport sportsCustomerSupport);

    /**
     * 修改门票与观众服务-客服支持
     * 
     * @param sportsCustomerSupport 门票与观众服务-客服支持
     * @return 结果
     */
    public int updateSportsCustomerSupport(SportsCustomerSupport sportsCustomerSupport);

    /**
     * 批量删除门票与观众服务-客服支持
     * 
     * @param ids 需要删除的门票与观众服务-客服支持主键集合
     * @return 结果
     */
    public int deleteSportsCustomerSupportByIds(Long[] ids);

    /**
     * 删除门票与观众服务-客服支持信息
     * 
     * @param id 门票与观众服务-客服支持主键
     * @return 结果
     */
    public int deleteSportsCustomerSupportById(Long id);
}
