import net.spy.memcached.MemcachedClient;
import java.net.*;
import java.util.Arrays;
import java.net.InetSocketAddress;
import java.util.concurrent.Future;
import net.spy.memcached.MemcachedClient;

public class TestJava {
   public static void main(String[] args) {
      try{  
		 
		 // 连接本地的 Memcached 服务
         MemcachedClient mcc = new MemcachedClient(new InetSocketAddress("127.0.0.1", 11211));
         System.out.println("Connection to server sucessful.");
      

         // 存储数据
         Future fo = mcc.set("runb", 900, "Free Education");
      

         // 查看存储状态
         System.out.println("set status:" + fo.get());
         
         // 输出值
         System.out.println("runb value in cache - " + mcc.get("runb"));


		 //输出php设置的值
		 System.out.println("username: "+mcc.get("username"));
		 System.out.println("password: "+mcc.get("password"));

         // 关闭连接
         mcc.shutdown();

         
      }catch(Exception ex){
         System.out.println( ex.getMessage() );
      }
   }
}