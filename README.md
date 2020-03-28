# PeriferiaPropuestaAPI
Propuesta integracion de servicios, los aspectos relevantes en transporte para consumo son:

### 1.Escenario Orquestador:
 * SOAP to REST.
 * Exposición para consumo en Datapower Externo.
 * Backend HTTPS TLS 1.2 mutual (two way), cliente y servidor presentan certificados.
 * Se remueven headers de WS-Security antes de enviar a clientes.
 * En mensajería SOAP response enviada desde backend.
 * Firma digital WS-Security con algoritmo de firma rsa-sha512 http://www.w3.org/2001/04/xmldsig-more#rsa-sha512,    algoritmo de huella (digest) de mensaje http://www.w3.org/2001/04/xmlenc#sha512, referencia de token BinarySecurityToken. La regla de layout a aplicar al encabezado de seguridad (Security Header Layout) será strict. Se firmará header de timestamp y body de mensaje SOAP.
 * Validación de credenciales extraídas de header WS-SEC UserNameToken con password de tipo PasswordDigest.

### 2.Escenario Orquestador:
 * REST to REST.
 * Exposición para consumo en Datapower Externo.
 * Backend HTTPS TLS 1.2 mutual (two way), cliente y servidor presentan certificados.
 
### APImock Backend:
  * Backend HTTPS TLS 1.2 mutual (two way), cliente y servidor presentan certificados.
  
  Confidencialidad e integridad:**JWS**
  
  * Serialización: General JSON
  * Algoritmo: RS256 (RSASSA-PKCS-v1_5 usando SHA-256) Esquema de firma con apéndice estandarizado por primera vez en la versión 1.5 de PKCS # 1. Requiere un tamaño de clave de 2048 bits o mayor
  * Encabezado Protegido: 
  
_**`Nombre:`**_ Signature
 _**`Valor:`**_ PayLoad
 
 No repudio:**JWE**
 
  * Serialización: General JSON
  * Algoritmo: A256CBC-HS512(AES_256_CBC_HMAC_SHA_512 algoritmo de cifrado autenticado).
  * Encabezado Protegido: 
  
 _**`Nombre:`**_ Encrypted
 _**`Valor:`**_ PayLoadEncrypt
					 
  * Encabezado no protegido compartido: 
  
 _**`Nombre:`**_ Signature
_**`Valor:`**_ PayLoad
					 
  * basic-auth-name: Cuando se usa con HTTP BasicAuth, devuelve el nombre del encabezado HTTP de autorización, DataPower autenticó y autorizó primero todas las solicitudes de los clientes extrayendo las credenciales del Encabezado de autenticación básica HTTP entrante y verificándolas en un servidor de Protocolo ligero:
                     
_**`Usuario:`**_  periferia
_**`Contraseña:`**_  periferia