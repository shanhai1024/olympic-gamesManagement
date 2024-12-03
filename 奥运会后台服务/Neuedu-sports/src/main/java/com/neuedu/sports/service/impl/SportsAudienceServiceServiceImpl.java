package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsAudienceServiceMapper;
import com.neuedu.sports.domain.SportsAudienceService;
import com.neuedu.sports.service.ISportsAudienceServiceService;

/**
 * 门票与观众服务-观众服务Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAudienceServiceServiceImpl extends ServiceImpl<SportsAudienceServiceMapper, SportsAudienceService> implements ISportsAudienceServiceService
{
    private final SportsAudienceServiceMapper sportsAudienceServiceMapper;

    /**
     * 查询门票与观众服务-观众服务
     * 
     * @param id 门票与观众服务-观众服务主键
     * @return 门票与观众服务-观众服务
     */
    @Override
    public SportsAudienceService selectSportsAudienceServiceById(Long id)
    {
        return sportsAudienceServiceMapper.selectSportsAudienceServiceById(id);
    }

    /**
     * 查询门票与观众服务-观众服务列表
     * 
     * @param sportsAudienceService 门票与观众服务-观众服务
     * @return 门票与观众服务-观众服务
     */
    @Override
    public List<SportsAudienceService> selectSportsAudienceServiceList(SportsAudienceService sportsAudienceService)
    {
        return sportsAudienceServiceMapper.selectSportsAudienceServiceList(sportsAudienceService);
    }

    /**
     * 新增门票与观众服务-观众服务
     * 
     * @param sportsAudienceService 门票与观众服务-观众服务
     * @return 结果
     */
    @Override
    public int insertSportsAudienceService(SportsAudienceService sportsAudienceService)
    {
        sportsAudienceService.setCreateTime(DateUtils.getNowDate());
        return sportsAudienceServiceMapper.insertSportsAudienceService(sportsAudienceService);
    }

    /**
     * 修改门票与观众服务-观众服务
     * 
     * @param sportsAudienceService 门票与观众服务-观众服务
     * @return 结果
     */
    @Override
    public int updateSportsAudienceService(SportsAudienceService sportsAudienceService)
    {
        sportsAudienceService.setUpdateTime(DateUtils.getNowDate());
        return sportsAudienceServiceMapper.updateSportsAudienceService(sportsAudienceService);
    }

    /**
     * 批量删除门票与观众服务-观众服务
     * 
     * @param ids 需要删除的门票与观众服务-观众服务主键
     * @return 结果
     */
    @Override
    public int deleteSportsAudienceServiceByIds(Long[] ids)
    {
        return sportsAudienceServiceMapper.deleteSportsAudienceServiceByIds(ids);
    }

    /**
     * 删除门票与观众服务-观众服务信息
     * 
     * @param id 门票与观众服务-观众服务主键
     * @return 结果
     */
    @Override
    public int deleteSportsAudienceServiceById(Long id)
    {
        return sportsAudienceServiceMapper.deleteSportsAudienceServiceById(id);
    }
}
