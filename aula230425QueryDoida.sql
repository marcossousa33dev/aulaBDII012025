select min(temperatura) as temperatura_minima, (select datahora_leitura
                                                   from sensores
												   where temperatura = (select min(temperatura) as temperatura_minima
                                                                        from sensores
																		where temperatura between (select min(temperatura) 
						                                                                           from sensores
                                                                                                   where datahora_leitura > (select max(datahora_leitura) 
																															 from sensores
																															 where temperatura = 12))
				                                                                                     and 
                                                                                                         (select max(temperatura)
                                                                                                          from sensores))
                                                  ) as datahora_leituraVAISEFERRAR
from sensores
where temperatura between (select min(temperatura) 
						   from sensores
                           where datahora_leitura > (select max(datahora_leitura) 
													 from sensores
													  where temperatura = 12))
				  and 
                           (select max(temperatura)
                            from sensores);
                            
######################################################################

select datahora_leitura
from sensores
where temperatura = (select min(temperatura) as temperatura_minima
from sensores
where temperatura between (select min(temperatura) 
						   from sensores
                           where datahora_leitura > (select max(datahora_leitura) 
													 from sensores
													  where temperatura = 12))
				  and 
                           (select max(temperatura)
                            from sensores));



