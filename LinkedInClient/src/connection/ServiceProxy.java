package connection;

public class ServiceProxy implements connection.Service {
  private String _endpoint = null;
  private connection.Service service = null;
  
  public ServiceProxy() {
    _initServiceProxy();
  }
  
  public ServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initServiceProxy();
  }
  
  private void _initServiceProxy() {
    try {
      service = (new connection.ServiceServiceLocator()).getService();
      if (service != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)service)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)service)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (service != null)
      ((javax.xml.rpc.Stub)service)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public connection.Service getService() {
    if (service == null)
      _initServiceProxy();
    return service;
  }
  
  public java.lang.String signUp(java.lang.String userName, java.lang.String password, java.lang.String fName, java.lang.String lName, java.lang.String city, java.lang.String mobile) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.signUp(userName, password, fName, lName, city, mobile);
  }
  
  public connection.UsersBean signIn(java.lang.String user, java.lang.String pass) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.signIn(user, pass);
  }
  
  public connection.UsersBean getProfile(java.lang.String user) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getProfile(user);
  }
  
  public void updateProfile(java.lang.String user, java.lang.String sum, java.lang.String exp, java.lang.String edu, java.lang.String proj) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    service.updateProfile(user, sum, exp, edu, proj);
  }
  
  public java.lang.String[] getConnections(java.lang.String user) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getConnections(user);
  }
  
  public java.lang.String[] getConnReq(java.lang.String user) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getConnReq(user);
  }
  
  
}