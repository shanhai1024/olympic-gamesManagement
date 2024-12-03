package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsTransportationServiceMapper;
import com.neuedu.sports.domain.SportsTransportationService;
import com.neuedu.sports.service.ISportsTransportationServiceService;

/**
 * 住宿与交通调度-交通服务Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsTransportationServiceServiceImpl extends ServiceImpl<SportsTransportationServiceMapper, SportsTransportationService> implements ISportsTransportationServiceService
{
    private final SportsTransportationServiceMapper sportsTransportationServiceMapper;

    /**
     * 查询住宿与交通调度-交通服务
     * 
     * @param id 住宿与交通调度-交通服务主键
     * @return 住宿与交通调度-交通服务
     */
    @Override
    public SportsTransportationService selectSportsTransportationServiceById(Long id)
    {
        return sportsTransportationServiceMapper.selectSportsTransportationServiceById(id);
    }

    /**
     * 查询住宿与交通调度-交通服务列表
     * 
     * @param sportsTransportationService 住宿与交通调度-交通服务
     * @return 住宿与交通调度-交通服务
     */
    @Override
    public List<SportsTransportationService> selectSportsTransportationServiceList(SportsTransportationService sportsTransportationService)
    {
        return sportsTransportationServiceMapper.selectSportsTransportationServiceList(sportsTransportationService);
    }

    /**
     * 新增住宿与交通调度-交通服务
     * 
     * @param sportsTransportationService 住宿与交通调度-交通服务
     * @return 结果
     */
    @Override
    public int insertSportsTransportationService(SportsTransportationService sportsTransportationService)
    {
        sportsTransportationService.setCreateTime(DateUtils.getNowDate());
        return sportsTransportationServiceMapper.insertSportsTransportationService(sportsTransportationService);
    }

    /**
     * 修改住宿与交通调度-交通服务
     * 
     * @param sportsTransportationService 住宿与交通调度-交通服务
     * @return 结果
     */
    @Override
    public int updateSportsTransportationService(SportsTransportationService sportsTransportationService)
    {
        sportsTransportationService.setUpdateTime(DateUtils.getNowDate());
        return sportsTransportationServiceMapper.updateSportsTransportationService(sportsTransportationService);
    }

    /**
     * 批量删除住宿与交通调度-交通服务
     * 
     * @param ids 需要删除的住宿与交通调度-交通服务主键
     * @return 结果
     */
    @Override
    public int deleteSportsTransportationServiceByIds(Long[] ids)
    {
        return sportsTransportationServiceMapper.deleteSportsTransportationServiceByIds(ids);
    }

    /**
     * 删除住宿与交通调度-交通服务信息
     * 
     * @param id 住宿与交通调度-交通服务主键
     * @return 结果
     */
    @Override
    public int deleteSportsTransportationServiceById(Long id)
    {
        return sportsTransportationServiceMapper.deleteSportsTransportationServiceById(id);
    }
}
