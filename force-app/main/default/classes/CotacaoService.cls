public with sharing class CotacaoService {
   
    private final static String serviceUrl = 'https://economia.awesomeapi.com.br/json/daily/{origem}-BRL/1';

       public static List<Cotacao> getCotacao(String moedaOrigem){
            String endpoint = serviceUrl.replace('{origem}', moedaOrigem);

            Http http = new Http();
            HttpRequest request = new HttpRequest();
            //request.setEndpoint(serviceUrl + '/' + moedaOrigem);
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            request.setTimeout(12000);
            request.setHeader('Content-Type', 'application/json');
            HttpResponse response = http.send(request);

            //https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status
            if(response.getStatusCode()==200){
              
                String jsonString = response.getBody();
                //System.debug(jsonString);
                return Cotacao.parse(jsonString);

            }else{
                Map<String, String> error = new Map<String, String>();
                error.put('statuscode', String.valueOf(response.getStatusCode()));
                error.put('status', response.getStatus());
                error.put('body', response.getBody());
                
                throw new CotacaoServiceException(JSON.serialize(error));

            }           
       }


       public void test() {

        List<Cotacao> result = CotacaoService.getCotacao('USD');
        System.debug(result);

       }

       public class CotacaoServiceException extends Exception{}
}