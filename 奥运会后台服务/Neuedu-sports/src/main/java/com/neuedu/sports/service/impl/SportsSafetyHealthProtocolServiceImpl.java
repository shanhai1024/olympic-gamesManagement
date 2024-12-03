package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsSafetyHealthProtocolMapper;
import com.neuedu.sports.domain.SportsSafetyHealthProtocol;
import com.neuedu.sports.service.ISportsSafetyHealthProtocolService;

/**
 * 安全与健康协议Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsSafetyHealthProtocolServiceImpl extends ServiceImpl<SportsSafetyHealthProtocolMapper, SportsSafetyHealthProtocol> implements ISportsSafetyHealthProtocolService
{
    private final SportsSafetyHealthProtocolMapper sportsSafetyHealthProtocolMapper;

    /**
     * 查询安全与健康协议
     * 
     * @param id 安全与健康协议主键
     * @return 安全与健康协议
     */
    @Override
    public SportsSafetyHealthProtocol selectSportsSafetyHealthProtocolById(Long id)
    {
        return sportsSafetyHealthProtocolMapper.selectSportsSafetyHealthProtocolById(id);
    }

    /**
     * 查询安全与健康协议列表
     * 
     * @param sportsSafetyHealthProtocol 安全与健康协议
     * @return 安全与健康协议
     */
    @Override
    public List<SportsSafetyHealthProtocol> selectSportsSafetyHealthProtocolList(SportsSafetyHealthProtocol sportsSafetyHealthProtocol)
    {
        return sportsSafetyHealthProtocolMapper.selectSportsSafetyHealthProtocolList(sportsSafetyHealthProtocol);
    }

    /**
     * 新增安全与健康协议
     * 
     * @param sportsSafetyHealthProtocol 安全与健康协议
     * @return 结果
     */
    @Override
    public int insertSportsSafetyHealthProtocol(SportsSafetyHealthProtocol sportsSafetyHealthProtocol)
    {
        sportsSafetyHealthProtocol.setCreateTime(DateUtils.getNowDate());
        return sportsSafetyHealthProtocolMapper.insertSportsSafetyHealthProtocol(sportsSafetyHealthProtocol);
    }

    /**
     * 修改安全与健康协议
     * 
     * @param sportsSafetyHealthProtocol 安全与健康协议
     * @return 结果
     */
    @Override
    public int updateSportsSafetyHealthProtocol(SportsSafetyHealthProtocol sportsSafetyHealthProtocol)
    {
        sportsSafetyHealthProtocol.setUpdateTime(DateUtils.getNowDate());
        return sportsSafetyHealthProtocolMapper.updateSportsSafetyHealthProtocol(sportsSafetyHealthProtocol);
    }

    /**
     * 批量删除安全与健康协议
     * 
     * @param ids 需要删除的安全与健康协议主键
     * @return 结果
     */
    @Override
    public int deleteSportsSafetyHealthProtocolByIds(Long[] ids)
    {
        return sportsSafetyHealthProtocolMapper.deleteSportsSafetyHealthProtocolByIds(ids);
    }

    /**
     * 删除安全与健康协议信息
     * 
     * @param id 安全与健康协议主键
     * @return 结果
     */
    @Override
    public int deleteSportsSafetyHealthProtocolById(Long id)
    {
        return sportsSafetyHealthProtocolMapper.deleteSportsSafetyHealthProtocolById(id);
    }
}
