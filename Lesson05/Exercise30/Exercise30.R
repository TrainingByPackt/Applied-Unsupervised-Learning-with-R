get_hash<-function(string_to_hash, total_possible_hashes){
  numeric<-utf8ToInt(string_to_hash)
  hash<-sum((numeric+123)^2) %% total_possible_hashes
  return(hash)
}
script_1<-"print('Take the cake')"
script_2<-"print('Make the cake')"
script_3<-"print('Take the rake')"
script_4<-"print('Take the towel')"

print(get_hash(script_1,10000))
print(get_hash(script_2,10000))
print(get_hash(script_3,10000))
print(get_hash(script_4,10000))
