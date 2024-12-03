package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsTicketManagementMapper;
import com.neuedu.sports.domain.SportsTicketManagement;
import com.neuedu.sports.service.ISportsTicketManagementService;

/**
 * 门票与观众服务-门票管理Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsTicketManagementServiceImpl extends ServiceImpl<SportsTicketManagementMapper, SportsTicketManagement> implements ISportsTicketManagementService
{
    private final SportsTicketManagementMapper sportsTicketManagementMapper;

    /**
     * 查询门票与观众服务-门票管理
     * 
     * @param id 门票与观众服务-门票管理主键
     * @return 门票与观众服务-门票管理
     */
    @Override
    public SportsTicketManagement selectSportsTicketManagementById(Long id)
    {
        return sportsTicketManagementMapper.selectSportsTicketManagementById(id);
    }

    /**
     * 查询门票与观众服务-门票管理列表
     * 
     * @param sportsTicketManagement 门票与观众服务-门票管理
     * @return 门票与观众服务-门票管理
     */
    @Override
    public List<SportsTicketManagement> selectSportsTicketManagementList(SportsTicketManagement sportsTicketManagement)
    {
        return sportsTicketManagementMapper.selectSportsTicketManagementList(sportsTicketManagement);
    }

    /**
     * 新增门票与观众服务-门票管理
     * 
     * @param sportsTicketManagement 门票与观众服务-门票管理
     * @return 结果
     */
    @Override
    public int insertSportsTicketManagement(SportsTicketManagement sportsTicketManagement)
    {
        sportsTicketManagement.setCreateTime(DateUtils.getNowDate());
        return sportsTicketManagementMapper.insertSportsTicketManagement(sportsTicketManagement);
    }

    /**
     * 修改门票与观众服务-门票管理
     * 
     * @param sportsTicketManagement 门票与观众服务-门票管理
     * @return 结果
     */
    @Override
    public int updateSportsTicketManagement(SportsTicketManagement sportsTicketManagement)
    {
        sportsTicketManagement.setUpdateTime(DateUtils.getNowDate());
        return sportsTicketManagementMapper.updateSportsTicketManagement(sportsTicketManagement);
    }

    /**
     * 批量删除门票与观众服务-门票管理
     * 
     * @param ids 需要删除的门票与观众服务-门票管理主键
     * @return 结果
     */
    @Override
    public int deleteSportsTicketManagementByIds(Long[] ids)
    {
        return sportsTicketManagementMapper.deleteSportsTicketManagementByIds(ids);
    }

    /**
     * 删除门票与观众服务-门票管理信息
     * 
     * @param id 门票与观众服务-门票管理主键
     * @return 结果
     */
    @Override
    public int deleteSportsTicketManagementById(Long id)
    {
        return sportsTicketManagementMapper.deleteSportsTicketManagementById(id);
    }
}
