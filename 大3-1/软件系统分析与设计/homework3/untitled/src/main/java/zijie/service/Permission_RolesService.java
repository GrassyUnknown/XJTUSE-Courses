package zijie.service;

import zijie.dao.PermissionDao;
import zijie.model.Permission;
import zijie.model.Permission_Roles;

public class Permission_RolesService {
    public static boolean findRolePermission(int idroles, String namepermission){
        Permission pm = PermissionDao.selectByName(namepermission);
        if(pm==null){
            return false;
        }
        else{
            int idpermission = pm.idpermission;
            Permission_Roles pr = zijie.dao.Permission_RolesDao.selectByID(idroles,idpermission);
            if(pr==null){
                return false;
            }
            return true;
        }
    }
}
