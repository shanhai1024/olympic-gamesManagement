package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsTicketSalesMapper;
import com.neuedu.sports.domain.SportsTicketSales;
import com.neuedu.sports.service.ISportsTicketSalesService;

/**
 * 门票与观众服务-门票销售Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsTicketSalesServiceImpl extends ServiceImpl<SportsTicketSalesMapper, SportsTicketSales> implements ISportsTicketSalesService
{
    private final SportsTicketSalesMapper sportsTicketSalesMapper;

    /**
     * 查询门票与观众服务-门票销售
     * 
     * @param id 门票与观众服务-门票销售主键
     * @return 门票与观众服务-门票销售
     */
    @Override
    public SportsTicketSales selectSportsTicketSalesById(Long id)
    {
        return sportsTicketSalesMapper.selectSportsTicketSalesById(id);
    }

    /**
     * 查询门票与观众服务-门票销售列表
     * 
     * @param sportsTicketSales 门票与观众服务-门票销售
     * @return 门票与观众服务-门票销售
     */
    @Override
    public List<SportsTicketSales> selectSportsTicketSalesList(SportsTicketSales sportsTicketSales)
    {
        return sportsTicketSalesMapper.selectSportsTicketSalesList(sportsTicketSales);
    }

    /**
     * 新增门票与观众服务-门票销售
     * 
     * @param sportsTicketSales 门票与观众服务-门票销售
     * @return 结果
     */
    @Override
    public int insertSportsTicketSales(SportsTicketSales sportsTicketSales)
    {
        sportsTicketSales.setCreateTime(DateUtils.getNowDate());
        return sportsTicketSalesMapper.insertSportsTicketSales(sportsTicketSales);
    }

    /**
     * 修改门票与观众服务-门票销售
     * 
     * @param sportsTicketSales 门票与观众服务-门票销售
     * @return 结果
     */
    @Override
    public int updateSportsTicketSales(SportsTicketSales sportsTicketSales)
    {
        sportsTicketSales.setUpdateTime(DateUtils.getNowDate());
        return sportsTicketSalesMapper.updateSportsTicketSales(sportsTicketSales);
    }

    /**
     * 批量删除门票与观众服务-门票销售
     * 
     * @param ids 需要删除的门票与观众服务-门票销售主键
     * @return 结果
     */
    @Override
    public int deleteSportsTicketSalesByIds(Long[] ids)
    {
        return sportsTicketSalesMapper.deleteSportsTicketSalesByIds(ids);
    }

    /**
     * 删除门票与观众服务-门票销售信息
     * 
     * @param id 门票与观众服务-门票销售主键
     * @return 结果
     */
    @Override
    public int deleteSportsTicketSalesById(Long id)
    {
        return sportsTicketSalesMapper.deleteSportsTicketSalesById(id);
    }
}
