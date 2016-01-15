package com.changhong.app.utils;

import com.changhong.app.domain.AppStatus;
import com.changhong.app.service.SystemService;
import com.changhong.app.web.application.ApplicationEventPublisher;

/**
 * User: pengjie
 * Date: 16-1-14
 * Time: 下午6:21
 */
public class StatusManageUtils {

    private static SystemService systemService;
    /* 状态切换判断表 */
    private static boolean[][] adminResultCheck= {{false,false,false,false,false,false},
                                                  {true,false,false,false,false,false},
                                                  {true,false,false,false,false,false},
                                                  {false,true,false,false,true,false},
                                                  {false,false,false,true,false,false},
                                                  {false,false,false,false,false,false}};
    private static boolean[][] clientResultCheck= {{true,false,true,true,false,false},
                                                   {false,false,false,false,false,false},
                                                   {false,false,false,false,false,false},
                                                   {false,false,false,false,false,false},
                                                   {false,false,false,false,false,false},
                                                   {false,false,false,false,false,false}};

    public static void init() {
        systemService = (SystemService) ApplicationEventPublisher.getBean("systemService");
    }

    public static boolean checkStatusValid(int appId, String toStatus, boolean isAdminUser) {
        String oldStatus = systemService.obtainMarketAppStatus(appId);
        int oldStatusInt = AppStatus.getAppStatusInt(oldStatus);
        int toStatusInt = AppStatus.getAppStatusInt(toStatus);
        if (isAdminUser) {
            return adminResultCheck[toStatusInt][oldStatusInt];
        } else {
            return clientResultCheck[toStatusInt][oldStatusInt];
        }
    }

//    static class ResultCheck {
//        public boolean result;
//
//        public String resultReason;
//
//        ResultCheck(boolean result, String resultReason) {
//            this.result = result;
//            this.resultReason = resultReason;
//        }
//    }
}
