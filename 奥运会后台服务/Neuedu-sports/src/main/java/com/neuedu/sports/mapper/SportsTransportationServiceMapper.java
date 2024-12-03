package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsTransportationService;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 住宿与交通调度-交通服务Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsTransportationServiceMapper extends BaseMapper<SportsTransportationService>
{
    /**
     * 查询住宿与交通调度-交通服务
     * 
     * @param id 住宿与交通调度-交通服务主键
     * @return 住宿与交通调度-交通服务
     */
    public SportsTransportationService selectSportsTransportationServiceById(Long id);

    /**
     * 查询住宿与交通调度-交通服务列表
     * 
     * @param sportsTransportationService 住宿与交通调度-交通服务
     * @return 住宿与交通调度-交通服务集合
     */
    public List<SportsTransportationService> selectSportsTransportationServiceList(SportsTransportationService sportsTransportationService);

    /**
     * 新增住宿与交通调度-交通服务
     * 
     * @param sportsTransportationService 住宿与交通调度-交通服务
     * @return 结果
     */
    public int insertSportsTransportationService(SportsTransportationService sportsTransportationService);

    /**
     * 修改住宿与交通调度-交通服务
     * 
     * @param sportsTransportationService 住宿与交通调度-交通服务
     * @return 结果
     */
    public int updateSportsTransportationService(SportsTransportationService sportsTransportationService);

    /**
     * 删除住宿与交通调度-交通服务
     * 
     * @param id 住宿与交通调度-交通服务主键
     * @return 结果
     */
    public int deleteSportsTransportationServiceById(Long id);

    /**
     * 批量删除住宿与交通调度-交通服务
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsTransportationServiceByIds(Long[] ids);
}
