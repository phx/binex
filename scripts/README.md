# binex scripts

## vc (vulnerable compile)

`vc` compiles C binaries using `gcc` with all security features disabled.

#### Usage:

`vc [INPUT_FILE] <OUTPUT_FILE>`

## hex2ascii, hexorganize, and hex2ascii_organize

`hex2ascii` in combination with `hexorganize` function together like a command line variant of the web-based [RapidTables Hex to ASCII Text Converter](https://www.rapidtables.com/convert/number/hex-to-ascii.html).

Let's say you have a hex dump of the following characters:

```
8253350804b00080489c3f7f3ed80ffffffff18251160f7f4c110f7f3edc708252180a825333082533506f6369707b465443306c5f49345f74356d5f6c6c306d5f795f79336e3463646261653532ff85007df7f79af8f7f4c4405f1fac0010f7ddbbe9f7f4d0c0f7f3e5c0f7f3e000ff85d678f7dcc58df7f3e5c08048ecaff85d6840f7f60f09804b000f7f3e000f7f3ee20ff85d6b8f7f66d50f7f3f8905f1fac00f7f3e000804b000ff85d6b88048c868251160ff85d6a4ff85d6b88048be9f7f3e3fc0ff85d76cff85d7641182511605f1fac00ff85d6d000f7d81f21f7f3e000f7f3e0000f7d81f211
```

Let's run `hex2ascii` on that:

```
hex2ascii '8253350804b00080489c3f7f3ed80ffffffff18251160f7f4c110f7f3edc708252180a825333082533506f6369707b465443306c5f49345f74356d5f6c6c306d5f795f79336e3463646261653532ff85007df7f79af8f7f4c4405f1fac0010f7ddbbe9f7f4d0c0f7f3e5c0f7f3e000ff85d678f7dcc58df7f3e5c08048ecaff85d6840f7f60f09804b000f7f3e000f7f3ee20ff85d6b8f7f66d50f7f3f8905f1fac00f7f3e000804b000ff85d6b88048c868251160ff85d6a4ff85d6b88048be9f7f3e3fc0ff85d76cff85d7641182511605f1fac00ff85d6d000f7d81f21f7f3e000f7f3e0000f7d81f211' | tee /tmp/hex.tmp
S°H?>ØÿÿÿñQL>ÜpRS%3Pocip{FTC0l_I4_t5m_ll0m_y_y3n4cdbae52ÿ}÷÷ø÷ôÄ@_¬÷Ý»é÷ôÐÀ÷óåÀ÷óàÿÖx÷ÜÅ÷óåÀHì¯ø]h@÷ö	K>>âø]kfÕ?ñúÀ°ÿÖ¸HÈh%`ÿÖ¤ÿÖ¸H¾>?Àÿ×lÿ×dQñúÀø]m}ò>>÷Ø!
```

Now let's run `hexorganize` on the result:

```
hexorganize $(cat "/tmp/hex.tmp")
5SH°>?ÿÿØQñÿL>RpÜ3SP3picoCTF{I_l05t_4ll_my_m0n3y_bdc425ea÷}ÿ÷ø÷_@Äô÷¬÷é»Ý÷ÀÐô÷ÀåóÿàóÜ÷xÖó÷ÅHÀå]ø¯ìö÷@hK>øâ>k]Õfñ?Àú>¸ÖÿhÈHÿ`%ÿ¤Ö¸Ö¾HÿÀ?>ÿl×d×QÀúñm]øò}>Ø÷>
```

As you can see, the bytes were re-arranged in the order that we could grab the flag from the output:

`picoCTF{I_l05t_4ll_my_m0n3y_bdc425ea÷}`

You can actually chain the two commands together to receive the final output like so:

```
hexorganize $(hex2ascii '8253350804b00080489c3f7f3ed80ffffffff18251160f7f4c110f7f3edc708252180a825333082533506f6369707b465443306c5f49345f74356d5f6c6c306d5f795f79336e3463646261653532ff85007df7f79af8f7f4c4405f1fac0010f7ddbbe9f7f4d0c0f7f3e5c0f7f3e000ff85d678f7dcc58df7f3e5c08048ecaff85d6840f7f60f09804b000f7f3e000f7f3ee20ff85d6b8f7f66d50f7f3f8905f1fac00f7f3e000804b000ff85d6b88048c868251160ff85d6a4ff85d6b88048be9f7f3e3fc0ff85d76cff85d7641182511605f1fac00ff85d6d000f7d81f21f7f3e000f7f3e0000f7d81f211')
5SH°>?ÿÿØQñÿL>RpÜ3SP3picoCTF{I_l05t_4ll_my_m0n3y_bdc425ea÷}ÿ÷ø÷_@Äô÷¬÷é»Ý÷ÀÐô÷ÀåóÿàóÜ÷xÖó÷ÅHÀå]ø¯ìö÷@hK>øâ>k]Õfñ?Àú>¸ÖÿhÈHÿ`%ÿ¤Ö¸Ö¾HÿÀ?>ÿl×d×QÀúñm]øò}>Ø÷>
```

But you can also use the bash wrapper `hex2ascii_organize` to achieve the same result:

```
hex2ascii_organize '8253350804b00080489c3f7f3ed80ffffffff18251160f7f4c110f7f3edc708252180a825333082533506f6369707b465443306c5f49345f74356d5f6c6c306d5f795f79336e3463646261653532ff85007df7f79af8f7f4c4405f1fac0010f7ddbbe9f7f4d0c0f7f3e5c0f7f3e000ff85d678f7dcc58df7f3e5c08048ecaff85d6840f7f60f09804b000f7f3e000f7f3ee20ff85d6b8f7f66d50f7f3f8905f1fac00f7f3e000804b000ff85d6b88048c868251160ff85d6a4ff85d6b88048be9f7f3e3fc0ff85d76cff85d7641182511605f1fac00ff85d6d000f7d81f21f7f3e000f7f3e0000f7d81f211'
5SH°>?ÿÿØQñÿL>RpÜ3SP3picoCTF{I_l05t_4ll_my_m0n3y_bdc425ea÷}ÿ÷ø÷_@Äô÷¬÷é»Ý÷ÀÐô÷ÀåóÿàóÜ÷xÖó÷ÅHÀå]ø¯ìö÷@hK	>â>k]øÕf?Àú>Öÿ°ÈH¸`%h¤Öÿ¸Öÿ¾HÀ?>l×ÿd×ÿQÀúñm]øò}>Ø÷>
```

 


