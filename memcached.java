import net.spy.memcached.MemcachedClient;
import java.net.*;
import java.util.Arrays;
import java.net.InetSocketAddress;
import java.util.concurrent.Future;
import net.spy.memcached.MemcachedClient;

public class TestJava {
   public static void main(String[] args) {
      try{  
		 
		 // ���ӱ��ص� Memcached ����
         MemcachedClient mcc = new MemcachedClient(new InetSocketAddress("127.0.0.1", 11211));
         System.out.println("Connection to server sucessful.");
      

         // �洢����
         Future fo = mcc.set("runb", 900, "Free Education");
      

         // �鿴�洢״̬
         System.out.println("set status:" + fo.get());
         
         // ���ֵ
         System.out.println("runb value in cache - " + mcc.get("runb"));


		 //���php���õ�ֵ
		 System.out.println("username: "+mcc.get("username"));
		 System.out.println("password: "+mcc.get("password"));

         // �ر�����
         mcc.shutdown();

         
      }catch(Exception ex){
         System.out.println( ex.getMessage() );
      }
   }
}