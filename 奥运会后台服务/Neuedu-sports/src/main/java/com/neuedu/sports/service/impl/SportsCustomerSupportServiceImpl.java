package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsCustomerSupportMapper;
import com.neuedu.sports.domain.SportsCustomerSupport;
import com.neuedu.sports.service.ISportsCustomerSupportService;

/**
 * 门票与观众服务-客服支持Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsCustomerSupportServiceImpl extends ServiceImpl<SportsCustomerSupportMapper, SportsCustomerSupport> implements ISportsCustomerSupportService
{
    private final SportsCustomerSupportMapper sportsCustomerSupportMapper;

    /**
     * 查询门票与观众服务-客服支持
     * 
     * @param id 门票与观众服务-客服支持主键
     * @return 门票与观众服务-客服支持
     */
    @Override
    public SportsCustomerSupport selectSportsCustomerSupportById(Long id)
    {
        return sportsCustomerSupportMapper.selectSportsCustomerSupportById(id);
    }

    /**
     * 查询门票与观众服务-客服支持列表
     * 
     * @param sportsCustomerSupport 门票与观众服务-客服支持
     * @return 门票与观众服务-客服支持
     */
    @Override
    public List<SportsCustomerSupport> selectSportsCustomerSupportList(SportsCustomerSupport sportsCustomerSupport)
    {
        return sportsCustomerSupportMapper.selectSportsCustomerSupportList(sportsCustomerSupport);
    }

    /**
     * 新增门票与观众服务-客服支持
     * 
     * @param sportsCustomerSupport 门票与观众服务-客服支持
     * @return 结果
     */
    @Override
    public int insertSportsCustomerSupport(SportsCustomerSupport sportsCustomerSupport)
    {
        sportsCustomerSupport.setCreateTime(DateUtils.getNowDate());
        return sportsCustomerSupportMapper.insertSportsCustomerSupport(sportsCustomerSupport);
    }

    /**
     * 修改门票与观众服务-客服支持
     * 
     * @param sportsCustomerSupport 门票与观众服务-客服支持
     * @return 结果
     */
    @Override
    public int updateSportsCustomerSupport(SportsCustomerSupport sportsCustomerSupport)
    {
        sportsCustomerSupport.setUpdateTime(DateUtils.getNowDate());
        return sportsCustomerSupportMapper.updateSportsCustomerSupport(sportsCustomerSupport);
    }

    /**
     * 批量删除门票与观众服务-客服支持
     * 
     * @param ids 需要删除的门票与观众服务-客服支持主键
     * @return 结果
     */
    @Override
    public int deleteSportsCustomerSupportByIds(Long[] ids)
    {
        return sportsCustomerSupportMapper.deleteSportsCustomerSupportByIds(ids);
    }

    /**
     * 删除门票与观众服务-客服支持信息
     * 
     * @param id 门票与观众服务-客服支持主键
     * @return 结果
     */
    @Override
    public int deleteSportsCustomerSupportById(Long id)
    {
        return sportsCustomerSupportMapper.deleteSportsCustomerSupportById(id);
    }
}
