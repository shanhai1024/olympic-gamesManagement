package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsVolunteerApplicationApprovalMapper;
import com.neuedu.sports.domain.SportsVolunteerApplicationApproval;
import com.neuedu.sports.service.ISportsVolunteerApplicationApprovalService;

/**
 * 志愿者管理-申请与审批Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerApplicationApprovalServiceImpl extends ServiceImpl<SportsVolunteerApplicationApprovalMapper, SportsVolunteerApplicationApproval> implements ISportsVolunteerApplicationApprovalService
{
    private final SportsVolunteerApplicationApprovalMapper sportsVolunteerApplicationApprovalMapper;

    /**
     * 查询志愿者管理-申请与审批
     * 
     * @param id 志愿者管理-申请与审批主键
     * @return 志愿者管理-申请与审批
     */
    @Override
    public SportsVolunteerApplicationApproval selectSportsVolunteerApplicationApprovalById(Long id)
    {
        return sportsVolunteerApplicationApprovalMapper.selectSportsVolunteerApplicationApprovalById(id);
    }

    /**
     * 查询志愿者管理-申请与审批列表
     * 
     * @param sportsVolunteerApplicationApproval 志愿者管理-申请与审批
     * @return 志愿者管理-申请与审批
     */
    @Override
    public List<SportsVolunteerApplicationApproval> selectSportsVolunteerApplicationApprovalList(SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval)
    {
        return sportsVolunteerApplicationApprovalMapper.selectSportsVolunteerApplicationApprovalList(sportsVolunteerApplicationApproval);
    }

    /**
     * 新增志愿者管理-申请与审批
     * 
     * @param sportsVolunteerApplicationApproval 志愿者管理-申请与审批
     * @return 结果
     */
    @Override
    public int insertSportsVolunteerApplicationApproval(SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval)
    {
        sportsVolunteerApplicationApproval.setCreateTime(DateUtils.getNowDate());
        return sportsVolunteerApplicationApprovalMapper.insertSportsVolunteerApplicationApproval(sportsVolunteerApplicationApproval);
    }

    /**
     * 修改志愿者管理-申请与审批
     * 
     * @param sportsVolunteerApplicationApproval 志愿者管理-申请与审批
     * @return 结果
     */
    @Override
    public int updateSportsVolunteerApplicationApproval(SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval)
    {
        sportsVolunteerApplicationApproval.setUpdateTime(DateUtils.getNowDate());
        return sportsVolunteerApplicationApprovalMapper.updateSportsVolunteerApplicationApproval(sportsVolunteerApplicationApproval);
    }

    /**
     * 批量删除志愿者管理-申请与审批
     * 
     * @param ids 需要删除的志愿者管理-申请与审批主键
     * @return 结果
     */
    @Override
    public int deleteSportsVolunteerApplicationApprovalByIds(Long[] ids)
    {
        return sportsVolunteerApplicationApprovalMapper.deleteSportsVolunteerApplicationApprovalByIds(ids);
    }

    /**
     * 删除志愿者管理-申请与审批信息
     * 
     * @param id 志愿者管理-申请与审批主键
     * @return 结果
     */
    @Override
    public int deleteSportsVolunteerApplicationApprovalById(Long id)
    {
        return sportsVolunteerApplicationApprovalMapper.deleteSportsVolunteerApplicationApprovalById(id);
    }
}
