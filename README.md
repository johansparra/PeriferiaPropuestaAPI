# PeriferiaPropuestaAPI
Propuesta integracion de servicios, los aspectos relevantes en transporte para consumo son:
# Orquestador:
 *SOAP to REST.
 
 *Exposición para consumo en Datapower Externo.
 *Backend HTTPS TLS 1.2 mutual (two way), cliente y servidor presentan certificados.
           *Se remueven headers de WS-Security antes de enviar a clientes.
           *En mensajería SOAP response enviada desde backend.
           *Firma digital WS-Security con algoritmo de firma rsa-sha512 http://www.w3.org/2001/04/xmldsig-more#rsa-sha512,    algoritmo de huella (digest) de mensaje http://www.w3.org/2001/04/xmlenc#sha512, referencia de token BinarySecurityToken. La regla de layout a aplicar al encabezado de seguridad (Security Header Layout) será strict. Se firmará header de timestamp y body de mensaje SOAP.
           *Validación de credenciales extraídas de header WS-SEC UserNameToken con password de tipo PasswordDigest.

+ #API:
            Backend HTTPS TLS 1.2 mutual (two way), cliente y servidor presentan certificados.
FULL Security
