package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsTicketSales;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 门票与观众服务-门票销售Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsTicketSalesService extends IService<SportsTicketSales>
{
    /**
     * 查询门票与观众服务-门票销售
     * 
     * @param id 门票与观众服务-门票销售主键
     * @return 门票与观众服务-门票销售
     */
    public SportsTicketSales selectSportsTicketSalesById(Long id);

    /**
     * 查询门票与观众服务-门票销售列表
     * 
     * @param sportsTicketSales 门票与观众服务-门票销售
     * @return 门票与观众服务-门票销售集合
     */
    public List<SportsTicketSales> selectSportsTicketSalesList(SportsTicketSales sportsTicketSales);

    /**
     * 新增门票与观众服务-门票销售
     * 
     * @param sportsTicketSales 门票与观众服务-门票销售
     * @return 结果
     */
    public int insertSportsTicketSales(SportsTicketSales sportsTicketSales);

    /**
     * 修改门票与观众服务-门票销售
     * 
     * @param sportsTicketSales 门票与观众服务-门票销售
     * @return 结果
     */
    public int updateSportsTicketSales(SportsTicketSales sportsTicketSales);

    /**
     * 批量删除门票与观众服务-门票销售
     * 
     * @param ids 需要删除的门票与观众服务-门票销售主键集合
     * @return 结果
     */
    public int deleteSportsTicketSalesByIds(Long[] ids);

    /**
     * 删除门票与观众服务-门票销售信息
     * 
     * @param id 门票与观众服务-门票销售主键
     * @return 结果
     */
    public int deleteSportsTicketSalesById(Long id);
}
