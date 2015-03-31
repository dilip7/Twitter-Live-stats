module.exports =
# Universal metacards for quick lookup
  alluniversalmetacardids : [15]
  mongourl:"mongodb://mongodb:27017/livquik"
  mongourlplans:"mongodb://mongodb:27017/rechargeplans"
  neo4jurl:"http://neo4j:7474"
  url:"#{require('../url')}:#{require('../port')}"
  port: require('../port')
  pwd:"/tmp"
  mysql:
    host: "mysql"
    user: "mohitl"
    password: "mohitl11"
    database: "livquik"
    connectionLimit:100
  hdfc:
    merchantid: "11572"
    tranportalid: "90003172"
    password: "password1"
    enrollmentUrl: "https://securepgtest.fssnet.co.in/pgway/servlet/MPIVerifyEnrollmentXMLServlet"
    tranportalUrl: "https://securepgtest.fssnet.co.in/pgway/servlet/TranPortalXMLServlet"
    paresUrl: "https://securepgtest.fssnet.co.in/pgway/servlet/MPIPayerAuthenticationXMLServlet"
    outlet:16
  direcpay:
    key: "v8sejAgSe+PK9nymyTGL6Q=="
    url: "https://test.direcpay.com/direcpay/secure/dpDirectIntegration.jsp"
  tokenEx:
    url: "https://test-api.tokenex.com/TokenServices.svc/REST"
    APIKey:"gSQH0PAIWMYdA8BLLoem"
    TokenExID: "7539460986937265"
  foursquare:
    client_id:'DZQTU34YJX2RMV1KNWGYAJJCD0EFV5GPVSZTCOJEWSC1FJDB'
    client_secret:'GDPRIVKUAS2AKJNO42PWXRWCYSMWNM4M2NONWJ4UA0BYASWD'
  blackberry:
    url:'https://pushapi.eval.blackberry.com/mss/PD_pushRequest'
    id:'3315-8B9220980rri80639ff125Mt7c5aa732781'
    password:'smnBIWO3'
  zipdial:
    customer_token:"09f90eebf2651886420d9b6ec9852ee07e2da57f"
    z2vtoken:"437ee64074763c08c0ea1546920a898f0d415c9b"
  noti:
    appid:'43dfb10e-107e-822d-ae1b-7758468c33f8'
    url:'https://notiapp.com/api/v1/add'
  spreedly:
    environment_key : "Q8pxm1lrSuwYpjLm2GpvhSFxbvu"
    access_secret : "P3ZC4iPgloxCbBKOBBylUOMINmtx9SgwbkjPPuih5Ey4xomAo4U40mVpwgYZrAtD"
    gateway : "UfTDbuRvQwer4di90rrmag112OT"
  gcm:
    sender_id:'890543919990'
    server_key:'AIzaSyDoIJkYhQDR9NSZWheJkVP8bYTmRhdJrg4'
  apns:
   cert: './pushcertdev.pem'
   key: './pushkeydev.pem'
   gateway: 'gateway.sandbox.push.apple.com'
   passphrase: 'spiral666'
  sms:
    smsgupshup:
      url: "https://enterprise.smsgupshup.com/GatewayAPI/rest?"
      userid:"2000118665"
      password:"LQQW04072012"
      keyword:"QWVERIFY"
      provider:"gupshup"
    solutionsinfini:
      url:"http://alerts.solutionsinfini.com/api/web2sms.php"
      key:"zqk3994fh38234almw214x9c41q645"
      provider:"solutionsinfini"
  recaptcha:
    private_key: "6Lc6Be4SAAAAAOzFrBWydGS7WMzs-cb-XkTIzrxD"
    public_key: "6Lc6Be4SAAAAAI-8kYb9GJ2PwUSZCO41rT63B3_6"
    url: "https://www.google.com/recaptcha/api/js/recaptcha_ajax.js"
  loggr:
    log_key : "qvtnew"
    connection_key : "4056d2eb160b42cea8531554d496207a"
  scripts:
    path:"/home/vinayp/scripts"
    language:
      ruby:"ruby1.9.1"
    name:
      company:"company.rb"
      retailer:"retailers.rb"
  bindb : "/opt/bins_iso_7_2.csv"
  bitly:
    client_id : "a2ebc18e2fe8d8053ab02e1055fd9ce968a7fdcb"
    client_secret : "8e929faf5489a2a561bfdd235ed963d4000db905"
    access_token : "fd0dcb8ba83313982ac0c88d62c5a658a7327ffd"
  # ask vinay about this
  smsgupshuppayment:
    userid:"2000118665"
    password:"LQQW04072012"
    keyword:"" #"QWPAY" Ignoring keyword.
  extraids: []
  cashbackrids : [1]


  # Redis 
  redis: require('./redis')

  #Geolocation / hashing
  # Precision, Distance of Adjacent Cell in Meters
  # 1-> 5003530
  # 2-> 625441
  # 3-> 123264
  # 4-> 19545
  # 5-> 3803
  # 6-> 610
  # 7-> 118
  # 8-> 19
  # 9-> 3.71
  # 10-> 0.6
  geo:
    precision:1
    defaults:
      latitude: 19.113453
      longitude: 72.893693
      minradius: 10
      maxradius: 5000
      unit: 'km'


  # Mongo
  mongo:
    collection:
      bills:"bills"
      settlements:"settlements"

  # PayU
  payu:
    ips:["122.179.175.29"]
    merchantid: "392845"
    merchantkey: "nlXftB"
    salt:    "P6smIhHa"
    url: "https://test.payu.in/_payment/"
    webserviceurl:"https://test.payu.in/merchant/postservice"
    commands:
      verify:"verify_payment"
    status:
      success: "success"
      pending: "pending"
      failure: "failure"
    aggregator:
      header:
        authorization: "10Tfkc/EuShwGlinNs4FuIjnk5WvZtnlAxVQYbym0t4="
        contenttype: "application/x-www-form-urlencoded"
      endpoints:
        register: "https://test.payumoney.com/auth/merchant/oneStepRegister"
        split: "https://test.payumoney.com/payment/payment/addPaymentSplit"
        release:"https://test.payumoney.com/payment/merchant/releasePayment"
      nodalStatus:
        success:1
        failure:2
      paymentSplit:
        success:0
        failure:-1
      # 60 minutes wait for PayU -> PayUMoney payment sync
      payusync:3600
    twofactor:
      paymentgateway:"PG_TYPE"
      bankreference:"bank_ref_num"
      bankcode:"bankcode"
      error:"error"
      errormessage:"error_Message"


  social:
    shareurl : "http://www.quikwallet.com/referral/referral.html"
    types:
      facebook: 'facebook'
      twitter: 'twitter'
      googleplus: 'googleplus'
    # Facebook
    facebook:
      appid : "647770105313147"
      appsecret : "ce1536ec70d1e56fdcf57a3ae5a1ebe1"

    #Twitter 
    twitter :
      consumer_key : "btaPryufHjtrpRacIBmyRg"
      consumer_secret : "9sJAf9a33FiweEF12m5bG9T1r1ZAYfHRqFQnNIWwEOI"

    googleplus :
      client_id : "992961189866-4vsi9pei40o525eap5k6lq3ht461kuid.apps.googleusercontent.com"
      client_secret : "AIzaSyBST8WwIUqqZENNFdsMWUCIfnPxvrHPpFU"

  # State Machine States
  states:
    initialized: "initialized"
    requested: "requested"
    attempted: "attempted"
    expired: "expired"
    rejected: "rejected"
    paid: "paid"
    failed: "failed"
    cancelled: "cancelled"
    settled: "settled"
    partvoid: "partvoid"
    void: "void"
    refundpending:"refundpending"
    refunded:"refunded"
    dropped:"dropped"

  # Billpayment State Machine
  billpayments:
    attempted: "attempted"
    expired: "expired"
    paid: "paid"
    cyberplatfailed: "cyberplatfailed"
    pending: "pending"
    completed: "completed"
    failed: "failed"
    verificationfailed: "verificationfailed"
    cancelled: "cancelled"
    dropped: "dropped"
    refunded: "refunded"

  paymentstates:
    initialized: "initialized"
    authorized: "authorized"
    pendingcapture: "pendingcapture"
    captured: "captured"
    partlyrefunded: "partlyrefunded"
    refunded: "refunded"
    failed: "failed"

  # Dytel constants
  dytel:
    discount:
      food: "Food Taxable Discount "
      liquor: "Liquor Taxable Discount "

  # 
  thirdparty:
    ipaddress:
      # SMS GupShup
      sms: "202.87.33.164"
      imissedcall:"103.22.193.67"

  ses:
    id: "AKIAJG3RFN6PFWY53UIQ"
    key: "a2luu6TJG5nEENxuzfTwtAoo/YDMKbR4F3yErZsb"

  configuration:
    node_environment:
      uat: "uat"
      development: "development"
      production: "production"
    crypto:
      cryptkey: "lasnajbfalfbalf2rn2jdnqjndkl"
      iv: "a2xhcgAAAAAAAAAA"

  pos:
    dytel:"dytel"
    shawman:"shawman"
    eretail: "eretail"
    api:
      payments:
        ttl:43200000
  
  flag:
    true:"Y"
    false:"N"

  push:
    failure:false
    success:true
    type:
      verified:"verified"
      checkout:"checkout"
      payment:"payment"
      recharge:"recharge"
    breakout:"breakout"
    no_push:"no_push"
    timeout:20

  errors:
    public:
      invalid_credentials:"Invalid credentials"
      locked: "Account is Locked"
    offers:
      dytel:
        break_on_duplicate:"break on duplicate billnumber"
    pos:
      settlement:
        invalid_data: "Missing required data."
        invalid_paymentids: "Invalid Payment IDs for given billnumber."
        invalid_state: "Payments were not settled."
        invalid_amounts: "Some/all payments were not settled correctly earlier."
        repeat_void: "This billnumber is already voided."
      requestpayment:
        exceed_max_amount: "Maximum value of payment set to "
    billpayments:
      codes:
        technical: [2,3,4,5,6,10,12,21,24,25,26,30,34,44,45,47,50,51,55,56]
        operator: [52,53,54,57,224]
        payment: [35,39,41,46]
        inprogress: [1,11,20]
        account: [9,19]
        number: [8,17]
        amount: [7,18]
        samenumber: [32,33,88]
        medium: [22]
        maxrecharge: [81]
        maxdaily: [82]
      messages:
        technical: "We seem to be facing a technical issue. Please retry after some time."
        operator: "Operator is currently unavailable. Please retry after some time."
        payment: "There was an error with the payment, please retry after some time."
        inprogress: "Transaction in progress for this number. Please retry after some time."
        account: "Please check the account number entered and retry your payment."
        number: "Please check the number entered and retry your payment."
        amount: "Please check the amount entered and retry your payment."
        samenumber: "You cannot recharge the same number immediately. Please retry in an hour."
        medium: "Payment was not accepted due to an error. Please retry with another payment medium."
        maxrecharge: "You have exceeded your daily debit limit. Please retry after 24 hours."
        maxdaily: "You have exceeded the maximum recharge amount."

  paymenttypes:
    partner: "partner"
    recharge: "recharge"
    push: "push"
    pull: "pull"
    billpay: "billpay"

  transaction:
    prefix:
      M:"1"
      C:"2"
      R:"3"
      B:"4"
    numericprefix:
      "1":"M"
      "2":"C"
      "3":"R"
      "4":"B"

  # DEprecate QS 2.0
  cardtypes:
    payment: "payment"
    prepaid: "prepaid"
    netbanking : "netbanking"

  paymentmethods:
    payment: "payment"
    prepaid: "prepaid"
    netbanking: "netbanking"
    paymentcard: "paymentcard"
    powrpay:"powrpay"
    ezeclick:"ezeclick"

  paymentmodes:
    payu:"payu"
    ezeclick:"ezeclick"
    hdfc: "hdfc"
    powrpay:"powrpay"
    prepaid:"prepaid"

  neo4j:
    user:
      referral:'referral'

  platform:
    android:
      name:"android"
      gcm:
        errors:
          missing_registration:"MissingRegistration"
          invalid_registration:"InvalidRegistration"
          mismatch_senderid:"MismatchSenderId"
          not_registered:"NotRegistered"
          messge_too_big:"MessageTooBig"
          invalid_data_key:"InvalidDataKey"
        ttl:36000
    ios:"ios"
    windows:"windows"
    blackberry:"blackberry"

  encryption:
    workfactor:10

  offers:
    qw:
      social:
        fb: "qwfbcon"
        tw: "qwtwcon"
        gplus: "qwgpcon"
      referral: "qwrefrl"
      addcard : "qwaddcard"
      register: "qwregister"

  mail:
    subjects:
      referral: "Congratulations, you just earned credits!"
      cashback: "Congratulations, you just received cashback!"
      recharge: "Your recharge was successful"
      register: "Welcome to QuikWallet"
      resetpassword : "Reset your password"
      payment: "Your payment was successful"
      passwordupdatesuccess : "Your password was changed"
      resetemail : "Change your email"
      emailupdatesuccess : "Your email address was changed"
      paymentrequest: "Your bill for "
      paymentrequestuserfee: "Fees Due"
      paymentreceipt: "Payment Received"
      billpaypaid: "Payment Received"
      billpaycomplete: "Transaction Successful"
      billpayfailed: "Transaction Failed"
    templates:
      referral: "referrer-registered"
      recharge: "recharge"
      register: "verify-email"
      resetpassword : "reset-password"
      payment: "payments"
      passwordupdatesuccess : "reset-success-password"
      resetemail: "reset-email"
      resetsuccessoldemail : "reset-success-oldemail"
      resetsuccessnewemail : "reset-success-newemail"
      paymentrequest: "paymentrequest"
      paymentrequestuserfee: "paymentrequestuserfee"
      paymentreceipt: "paymentreceipt"
      billpaypaid: "billpaypaid"
      billpaycomplete : "billpaycompleted"
      billpayfailed : "billpayfailed"

  billparser:
    parser: "shawman/busago"
    target: "https://server.livquik.com"
    ttl: 21600

  credit:
    referral:
      name:"referral"
      value:100
      trigger:0
    cap:
      billpay:10000
      default:2
  
  pagination:
    user:
      transactions:10

  archive:
    bulkupload: "/tmp/bulkupload/"

  paymentrequest:
    source:
      xls: "xls"
      qvt: "qvt"
      pos: "pos"
      partner: "partner"
      sms: "sms"
  checkin:
    source:
      missedcall:"missedcall"

  # script exclusion 
  scriptd:
    excludedoutlets : [51]
    excludedusers : [1,259,260,261,301,354,403,656,658,455,1078,390,396,607,270,298,310]
    email : "madhur.karnik@livquik.com,dilip.makwana@quikwallet.com"
    report : require('./report').metric

  # Max credit limit for a user.
  maxcredit: 10000

  cyberplat:
    dealerscode:  1003829
    outletcode:   1003851
    operatorcode: 1003852
    outletpassword: '3333333333'
    statuscheckcounter : 100
    pubkey: './pubkeys.key'
    secretkey: './secret.key'
  spirallabs:
    key: '5ZSBpfuuIKmshLRtx9tj6yN1OT35p1CMFPRjsnJio7D0J00ALH'
    url: 'https://sphirelabs-indian-caller-info-with-name-v1.p.mashape.com/caller/v1/get/callerinfo.php?number='
    uniqoperatorurl: 'https://community-telecom-data.p.mashape.com/telecom_data/listUniqOperator/&page=1&per_page=100'

  universalmetacards:
    billpaycard:
      id: 15
      name: 'QW Recharge Card'

  ezeclick:
    #    mid:"9820359248"
    #key:"c2E2EB5B2aBcbcbfd91fA0B90630a9AE"
    url:
      payment : "https://www.ezeclick.com/amexezeclick/payment/paymentRequest"
      verify : "https://www.ezeclick.com/amexezeclick/merchantService/getNZCTransactionStatus"
    status:
      success:"S"
      failure:"F"
      error:"T"
    outlets:[
      id:1
      mid:9820359248
      key:"c2E2EB5B2aBcbcbfd91fA0B90630a9AE"
    ,
      id:3
      mid:9820359248
      key:"c2E2EB5B2aBcbcbfd91fA0B90630a9AE"
    ]

  powrpay:
    mid:"48413491898076280327"
    key:"35484134918984234977"
    appid:"9970"
    url:"https://wallet.pc.enstage-sas.com/v1/wPay/pickup"
    status:
      success:"00"

  netbanking:
    codes:[
      'AXIB','BOIB','BOMB','CBIB','CRPB','DCBB','FEDB','HDFB','ICIB','IDBB','INDB','INIB','INOB','JAKB','KRKB','KRVB','SBBJB','SBHB','SBIB','SBMB','SBTB','SOIB','UBIB','UNIB','VJYB','YESB','CUBB','CABB','SBPB','CITNB','DSHB','162B'
    ]
    bank:
      'AXIB' : "AXIS Bank NetBanking"
      'BOIB' : "Bank of India"
      'BOMB' : "Bank of Maharashtra"
      'CBIB' : "Central Bank Of India"
      'CRPB' : "Corporation Bank"
      'DCBB' : "Development Credit Bank"
      'FEDB' : "Federal Bank"
      'HDFB' : "HDFC Bank"
      'ICIB' : "ICICI Netbanking"
      'IDBB' : "Industrial Development Bank of India"
      'INDB' : "Indian Bank "
      'INIB' : "IndusInd Bank"
      'INOB' : "Indian Overseas Bank"
      'JAKB' : "Jammu and Kashmir Bank"
      'KRKB' : "Karnataka Bank"
      'KRVB' : "Karur Vysya "
      'SBBJB' :  "State Bank of Bikaner and Jaipur"
      'SBHB' : "State Bank of Hyderabad"
      'SBIB' : "State Bank of India"
      'SBMB' : "State Bank of Mysore"
      'SBTB' : "State Bank of Travancore"
      'SOIB' : "South Indian Bank"
      'UBIB' : "Union Bank of India"
      'UNIB' : "United Bank Of India"
      'VJYB' : "Vijaya Bank"
      'YESB' : "Yes Bank"
      'CUBB' : "CityUnion"
      'CABB' : "Canara Bank"
      'SBPB' : "State Bank of Patiala"
      'CITNB' :  "Citi Bank NetBanking"
      'DSHB' : "Deutsche Bank"
      '162B' : "Kotak Bank"
