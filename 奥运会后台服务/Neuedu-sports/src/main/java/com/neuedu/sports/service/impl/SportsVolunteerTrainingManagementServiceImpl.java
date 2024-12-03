package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsVolunteerTrainingManagementMapper;
import com.neuedu.sports.domain.SportsVolunteerTrainingManagement;
import com.neuedu.sports.service.ISportsVolunteerTrainingManagementService;

/**
 * 志愿者管理-培训管理Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerTrainingManagementServiceImpl extends ServiceImpl<SportsVolunteerTrainingManagementMapper, SportsVolunteerTrainingManagement> implements ISportsVolunteerTrainingManagementService
{
    private final SportsVolunteerTrainingManagementMapper sportsVolunteerTrainingManagementMapper;

    /**
     * 查询志愿者管理-培训管理
     * 
     * @param id 志愿者管理-培训管理主键
     * @return 志愿者管理-培训管理
     */
    @Override
    public SportsVolunteerTrainingManagement selectSportsVolunteerTrainingManagementById(Long id)
    {
        return sportsVolunteerTrainingManagementMapper.selectSportsVolunteerTrainingManagementById(id);
    }

    /**
     * 查询志愿者管理-培训管理列表
     * 
     * @param sportsVolunteerTrainingManagement 志愿者管理-培训管理
     * @return 志愿者管理-培训管理
     */
    @Override
    public List<SportsVolunteerTrainingManagement> selectSportsVolunteerTrainingManagementList(SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement)
    {
        return sportsVolunteerTrainingManagementMapper.selectSportsVolunteerTrainingManagementList(sportsVolunteerTrainingManagement);
    }

    /**
     * 新增志愿者管理-培训管理
     * 
     * @param sportsVolunteerTrainingManagement 志愿者管理-培训管理
     * @return 结果
     */
    @Override
    public int insertSportsVolunteerTrainingManagement(SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement)
    {
        sportsVolunteerTrainingManagement.setCreateTime(DateUtils.getNowDate());
        return sportsVolunteerTrainingManagementMapper.insertSportsVolunteerTrainingManagement(sportsVolunteerTrainingManagement);
    }

    /**
     * 修改志愿者管理-培训管理
     * 
     * @param sportsVolunteerTrainingManagement 志愿者管理-培训管理
     * @return 结果
     */
    @Override
    public int updateSportsVolunteerTrainingManagement(SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement)
    {
        sportsVolunteerTrainingManagement.setUpdateTime(DateUtils.getNowDate());
        return sportsVolunteerTrainingManagementMapper.updateSportsVolunteerTrainingManagement(sportsVolunteerTrainingManagement);
    }

    /**
     * 批量删除志愿者管理-培训管理
     * 
     * @param ids 需要删除的志愿者管理-培训管理主键
     * @return 结果
     */
    @Override
    public int deleteSportsVolunteerTrainingManagementByIds(Long[] ids)
    {
        return sportsVolunteerTrainingManagementMapper.deleteSportsVolunteerTrainingManagementByIds(ids);
    }

    /**
     * 删除志愿者管理-培训管理信息
     * 
     * @param id 志愿者管理-培训管理主键
     * @return 结果
     */
    @Override
    public int deleteSportsVolunteerTrainingManagementById(Long id)
    {
        return sportsVolunteerTrainingManagementMapper.deleteSportsVolunteerTrainingManagementById(id);
    }
}
