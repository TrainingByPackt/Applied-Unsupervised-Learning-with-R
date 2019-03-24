string_to_hash<-"print('Take the cake')"

total_possible_hashes<-10000
numeric<-utf8ToInt(string_to_hash)
print(numeric)

hash<-sum((numeric+123)^2) %% total_possible_hashes
