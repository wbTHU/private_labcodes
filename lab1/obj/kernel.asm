
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 14 33 00 00       	call   103340 <memset>

    cons_init();                // init the console
  10002c:	e8 2e 15 00 00       	call   10155f <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 e0 34 10 00 	movl   $0x1034e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 fc 34 10 00 	movl   $0x1034fc,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 2c 29 00 00       	call   102986 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 43 16 00 00       	call   1016a2 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 95 17 00 00       	call   1017f9 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 e9 0c 00 00       	call   100d52 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 a2 15 00 00       	call   101610 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 f2 0b 00 00       	call   100c84 <mon_backtrace>
}
  100092:	c9                   	leave  
  100093:	c3                   	ret    

00100094 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100094:	55                   	push   %ebp
  100095:	89 e5                	mov    %esp,%ebp
  100097:	53                   	push   %ebx
  100098:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  10009e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a1:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ab:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b3:	89 04 24             	mov    %eax,(%esp)
  1000b6:	e8 b5 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bb:	83 c4 14             	add    $0x14,%esp
  1000be:	5b                   	pop    %ebx
  1000bf:	5d                   	pop    %ebp
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1000ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d1:	89 04 24             	mov    %eax,(%esp)
  1000d4:	e8 bb ff ff ff       	call   100094 <grade_backtrace1>
}
  1000d9:	c9                   	leave  
  1000da:	c3                   	ret    

001000db <grade_backtrace>:

void
grade_backtrace(void) {
  1000db:	55                   	push   %ebp
  1000dc:	89 e5                	mov    %esp,%ebp
  1000de:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e1:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e6:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ed:	ff 
  1000ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f9:	e8 c3 ff ff ff       	call   1000c1 <grade_backtrace0>
}
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	0f b7 c0             	movzwl %ax,%eax
  100119:	83 e0 03             	and    $0x3,%eax
  10011c:	89 c2                	mov    %eax,%edx
  10011e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100123:	89 54 24 08          	mov    %edx,0x8(%esp)
  100127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012b:	c7 04 24 01 35 10 00 	movl   $0x103501,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 0f 35 10 00 	movl   $0x10350f,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 1d 35 10 00 	movl   $0x10351d,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 2b 35 10 00 	movl   $0x10352b,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 39 35 10 00 	movl   $0x103539,(%esp)
  1001b2:	e8 5b 01 00 00       	call   100312 <cprintf>
    round ++;
  1001b7:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001bc:	83 c0 01             	add    $0x1,%eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c9:	5d                   	pop    %ebp
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d6:	e8 25 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001db:	c7 04 24 48 35 10 00 	movl   $0x103548,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 68 35 10 00 	movl   $0x103568,(%esp)
  1001f8:	e8 15 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_kernel();
  1001fd:	e8 c9 ff ff ff       	call   1001cb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100202:	e8 f9 fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100213:	74 13                	je     100228 <readline+0x1f>
        cprintf("%s", prompt);
  100215:	8b 45 08             	mov    0x8(%ebp),%eax
  100218:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021c:	c7 04 24 87 35 10 00 	movl   $0x103587,(%esp)
  100223:	e8 ea 00 00 00       	call   100312 <cprintf>
    }
    int i = 0, c;
  100228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022f:	e8 66 01 00 00       	call   10039a <getchar>
  100234:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10023b:	79 07                	jns    100244 <readline+0x3b>
            return NULL;
  10023d:	b8 00 00 00 00       	mov    $0x0,%eax
  100242:	eb 79                	jmp    1002bd <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100244:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100248:	7e 28                	jle    100272 <readline+0x69>
  10024a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100251:	7f 1f                	jg     100272 <readline+0x69>
            cputchar(c);
  100253:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100256:	89 04 24             	mov    %eax,(%esp)
  100259:	e8 da 00 00 00       	call   100338 <cputchar>
            buf[i ++] = c;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100261:	8d 50 01             	lea    0x1(%eax),%edx
  100264:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026a:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100270:	eb 46                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100272:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100276:	75 17                	jne    10028f <readline+0x86>
  100278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10027c:	7e 11                	jle    10028f <readline+0x86>
            cputchar(c);
  10027e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af 00 00 00       	call   100338 <cputchar>
            i --;
  100289:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10028d:	eb 29                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  10028f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100293:	74 06                	je     10029b <readline+0x92>
  100295:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100299:	75 1d                	jne    1002b8 <readline+0xaf>
            cputchar(c);
  10029b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 92 00 00 00       	call   100338 <cputchar>
            buf[i] = '\0';
  1002a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a9:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002ae:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b1:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002b6:	eb 05                	jmp    1002bd <readline+0xb4>
        }
    }
  1002b8:	e9 72 ff ff ff       	jmp    10022f <readline+0x26>
}
  1002bd:	c9                   	leave  
  1002be:	c3                   	ret    

001002bf <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bf:	55                   	push   %ebp
  1002c0:	89 e5                	mov    %esp,%ebp
  1002c2:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c8:	89 04 24             	mov    %eax,(%esp)
  1002cb:	e8 bb 12 00 00       	call   10158b <cons_putc>
    (*cnt) ++;
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	8b 00                	mov    (%eax),%eax
  1002d5:	8d 50 01             	lea    0x1(%eax),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
}
  1002dd:	c9                   	leave  
  1002de:	c3                   	ret    

001002df <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002df:	55                   	push   %ebp
  1002e0:	89 e5                	mov    %esp,%ebp
  1002e2:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100301:	c7 04 24 bf 02 10 00 	movl   $0x1002bf,(%esp)
  100308:	e8 4c 28 00 00       	call   102b59 <vprintfmt>
    return cnt;
  10030d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100310:	c9                   	leave  
  100311:	c3                   	ret    

00100312 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100312:	55                   	push   %ebp
  100313:	89 e5                	mov    %esp,%ebp
  100315:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100318:	8d 45 0c             	lea    0xc(%ebp),%eax
  10031b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10031e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100321:	89 44 24 04          	mov    %eax,0x4(%esp)
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 af ff ff ff       	call   1002df <vcprintf>
  100330:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100333:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100336:	c9                   	leave  
  100337:	c3                   	ret    

00100338 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100338:	55                   	push   %ebp
  100339:	89 e5                	mov    %esp,%ebp
  10033b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10033e:	8b 45 08             	mov    0x8(%ebp),%eax
  100341:	89 04 24             	mov    %eax,(%esp)
  100344:	e8 42 12 00 00       	call   10158b <cons_putc>
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100351:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100358:	eb 13                	jmp    10036d <cputs+0x22>
        cputch(c, &cnt);
  10035a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035e:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100361:	89 54 24 04          	mov    %edx,0x4(%esp)
  100365:	89 04 24             	mov    %eax,(%esp)
  100368:	e8 52 ff ff ff       	call   1002bf <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10036d:	8b 45 08             	mov    0x8(%ebp),%eax
  100370:	8d 50 01             	lea    0x1(%eax),%edx
  100373:	89 55 08             	mov    %edx,0x8(%ebp)
  100376:	0f b6 00             	movzbl (%eax),%eax
  100379:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100380:	75 d8                	jne    10035a <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	89 44 24 04          	mov    %eax,0x4(%esp)
  100389:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100390:	e8 2a ff ff ff       	call   1002bf <cputch>
    return cnt;
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a0:	e8 0f 12 00 00       	call   1015b4 <cons_getc>
  1003a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ac:	74 f2                	je     1003a0 <getchar+0x6>
        /* do nothing */;
    return c;
  1003ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bc:	8b 00                	mov    (%eax),%eax
  1003be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c4:	8b 00                	mov    (%eax),%eax
  1003c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d0:	e9 d2 00 00 00       	jmp    1004a7 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003db:	01 d0                	add    %edx,%eax
  1003dd:	89 c2                	mov    %eax,%edx
  1003df:	c1 ea 1f             	shr    $0x1f,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	d1 f8                	sar    %eax
  1003e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003ec:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ef:	eb 04                	jmp    1003f5 <stab_binsearch+0x42>
            m --;
  1003f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003fb:	7c 1f                	jl     10041c <stab_binsearch+0x69>
  1003fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100400:	89 d0                	mov    %edx,%eax
  100402:	01 c0                	add    %eax,%eax
  100404:	01 d0                	add    %edx,%eax
  100406:	c1 e0 02             	shl    $0x2,%eax
  100409:	89 c2                	mov    %eax,%edx
  10040b:	8b 45 08             	mov    0x8(%ebp),%eax
  10040e:	01 d0                	add    %edx,%eax
  100410:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041a:	75 d5                	jne    1003f1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10041c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100422:	7d 0b                	jge    10042f <stab_binsearch+0x7c>
            l = true_m + 1;
  100424:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100427:	83 c0 01             	add    $0x1,%eax
  10042a:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10042d:	eb 78                	jmp    1004a7 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100436:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100439:	89 d0                	mov    %edx,%eax
  10043b:	01 c0                	add    %eax,%eax
  10043d:	01 d0                	add    %edx,%eax
  10043f:	c1 e0 02             	shl    $0x2,%eax
  100442:	89 c2                	mov    %eax,%edx
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	8b 40 08             	mov    0x8(%eax),%eax
  10044c:	3b 45 18             	cmp    0x18(%ebp),%eax
  10044f:	73 13                	jae    100464 <stab_binsearch+0xb1>
            *region_left = m;
  100451:	8b 45 0c             	mov    0xc(%ebp),%eax
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100459:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10045c:	83 c0 01             	add    $0x1,%eax
  10045f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100462:	eb 43                	jmp    1004a7 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100464:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100467:	89 d0                	mov    %edx,%eax
  100469:	01 c0                	add    %eax,%eax
  10046b:	01 d0                	add    %edx,%eax
  10046d:	c1 e0 02             	shl    $0x2,%eax
  100470:	89 c2                	mov    %eax,%edx
  100472:	8b 45 08             	mov    0x8(%ebp),%eax
  100475:	01 d0                	add    %edx,%eax
  100477:	8b 40 08             	mov    0x8(%eax),%eax
  10047a:	3b 45 18             	cmp    0x18(%ebp),%eax
  10047d:	76 16                	jbe    100495 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100482:	8d 50 ff             	lea    -0x1(%eax),%edx
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048d:	83 e8 01             	sub    $0x1,%eax
  100490:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100493:	eb 12                	jmp    1004a7 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100495:	8b 45 0c             	mov    0xc(%ebp),%eax
  100498:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10049b:	89 10                	mov    %edx,(%eax)
            l = m;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a3:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ad:	0f 8e 22 ff ff ff    	jle    1003d5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b7:	75 0f                	jne    1004c8 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bc:	8b 00                	mov    (%eax),%eax
  1004be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c4:	89 10                	mov    %edx,(%eax)
  1004c6:	eb 3f                	jmp    100507 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004cb:	8b 00                	mov    (%eax),%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d0:	eb 04                	jmp    1004d6 <stab_binsearch+0x123>
  1004d2:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d9:	8b 00                	mov    (%eax),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 1f                	jge    1004ff <stab_binsearch+0x14c>
  1004e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e3:	89 d0                	mov    %edx,%eax
  1004e5:	01 c0                	add    %eax,%eax
  1004e7:	01 d0                	add    %edx,%eax
  1004e9:	c1 e0 02             	shl    $0x2,%eax
  1004ec:	89 c2                	mov    %eax,%edx
  1004ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f1:	01 d0                	add    %edx,%eax
  1004f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f7:	0f b6 c0             	movzbl %al,%eax
  1004fa:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fd:	75 d3                	jne    1004d2 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100505:	89 10                	mov    %edx,(%eax)
    }
}
  100507:	c9                   	leave  
  100508:	c3                   	ret    

00100509 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100509:	55                   	push   %ebp
  10050a:	89 e5                	mov    %esp,%ebp
  10050c:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100512:	c7 00 8c 35 10 00    	movl   $0x10358c,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 8c 35 10 00 	movl   $0x10358c,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 08             	mov    0x8(%ebp),%edx
  10053c:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100542:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100549:	c7 45 f4 ec 3d 10 00 	movl   $0x103dec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 08 b5 10 00 	movl   $0x10b508,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 09 b5 10 00 	movl   $0x10b509,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 e1 d4 10 00 	movl   $0x10d4e1,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100565:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100568:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056b:	76 0d                	jbe    10057a <debuginfo_eip+0x71>
  10056d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100570:	83 e8 01             	sub    $0x1,%eax
  100573:	0f b6 00             	movzbl (%eax),%eax
  100576:	84 c0                	test   %al,%al
  100578:	74 0a                	je     100584 <debuginfo_eip+0x7b>
        return -1;
  10057a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057f:	e9 c0 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100584:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100591:	29 c2                	sub    %eax,%edx
  100593:	89 d0                	mov    %edx,%eax
  100595:	c1 f8 02             	sar    $0x2,%eax
  100598:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059e:	83 e8 01             	sub    $0x1,%eax
  1005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b2:	00 
  1005b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c4:	89 04 24             	mov    %eax,(%esp)
  1005c7:	e8 e7 fd ff ff       	call   1003b3 <stab_binsearch>
    if (lfile == 0)
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	85 c0                	test   %eax,%eax
  1005d1:	75 0a                	jne    1005dd <debuginfo_eip+0xd4>
        return -1;
  1005d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d8:	e9 67 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ec:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f0:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f7:	00 
  1005f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ff:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100602:	89 44 24 04          	mov    %eax,0x4(%esp)
  100606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100609:	89 04 24             	mov    %eax,(%esp)
  10060c:	e8 a2 fd ff ff       	call   1003b3 <stab_binsearch>

    if (lfun <= rfun) {
  100611:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100614:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100617:	39 c2                	cmp    %eax,%edx
  100619:	7f 7c                	jg     100697 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061e:	89 c2                	mov    %eax,%edx
  100620:	89 d0                	mov    %edx,%eax
  100622:	01 c0                	add    %eax,%eax
  100624:	01 d0                	add    %edx,%eax
  100626:	c1 e0 02             	shl    $0x2,%eax
  100629:	89 c2                	mov    %eax,%edx
  10062b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	29 c1                	sub    %eax,%ecx
  10063a:	89 c8                	mov    %ecx,%eax
  10063c:	39 c2                	cmp    %eax,%edx
  10063e:	73 22                	jae    100662 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100640:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100643:	89 c2                	mov    %eax,%edx
  100645:	89 d0                	mov    %edx,%eax
  100647:	01 c0                	add    %eax,%eax
  100649:	01 d0                	add    %edx,%eax
  10064b:	c1 e0 02             	shl    $0x2,%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	8b 10                	mov    (%eax),%edx
  100657:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100662:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	01 c0                	add    %eax,%eax
  10066b:	01 d0                	add    %edx,%eax
  10066d:	c1 e0 02             	shl    $0x2,%eax
  100670:	89 c2                	mov    %eax,%edx
  100672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	8b 50 08             	mov    0x8(%eax),%edx
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 40 10             	mov    0x10(%eax),%eax
  100686:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10068f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100695:	eb 15                	jmp    1006ac <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100697:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069a:	8b 55 08             	mov    0x8(%ebp),%edx
  10069d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006af:	8b 40 08             	mov    0x8(%eax),%eax
  1006b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b9:	00 
  1006ba:	89 04 24             	mov    %eax,(%esp)
  1006bd:	e8 f2 2a 00 00       	call   1031b4 <strfind>
  1006c2:	89 c2                	mov    %eax,%edx
  1006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c7:	8b 40 08             	mov    0x8(%eax),%eax
  1006ca:	29 c2                	sub    %eax,%edx
  1006cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e0:	00 
  1006e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f2:	89 04 24             	mov    %eax,(%esp)
  1006f5:	e8 b9 fc ff ff       	call   1003b3 <stab_binsearch>
    if (lline <= rline) {
  1006fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	39 c2                	cmp    %eax,%edx
  100702:	7f 24                	jg     100728 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100704:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100707:	89 c2                	mov    %eax,%edx
  100709:	89 d0                	mov    %edx,%eax
  10070b:	01 c0                	add    %eax,%eax
  10070d:	01 d0                	add    %edx,%eax
  10070f:	c1 e0 02             	shl    $0x2,%eax
  100712:	89 c2                	mov    %eax,%edx
  100714:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071d:	0f b7 d0             	movzwl %ax,%edx
  100720:	8b 45 0c             	mov    0xc(%ebp),%eax
  100723:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100726:	eb 13                	jmp    10073b <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072d:	e9 12 01 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100732:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100735:	83 e8 01             	sub    $0x1,%eax
  100738:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100741:	39 c2                	cmp    %eax,%edx
  100743:	7c 56                	jl     10079b <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075e:	3c 84                	cmp    $0x84,%al
  100760:	74 39                	je     10079b <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100765:	89 c2                	mov    %eax,%edx
  100767:	89 d0                	mov    %edx,%eax
  100769:	01 c0                	add    %eax,%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	c1 e0 02             	shl    $0x2,%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100775:	01 d0                	add    %edx,%eax
  100777:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077b:	3c 64                	cmp    $0x64,%al
  10077d:	75 b3                	jne    100732 <debuginfo_eip+0x229>
  10077f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	89 d0                	mov    %edx,%eax
  100786:	01 c0                	add    %eax,%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	c1 e0 02             	shl    $0x2,%eax
  10078d:	89 c2                	mov    %eax,%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	01 d0                	add    %edx,%eax
  100794:	8b 40 08             	mov    0x8(%eax),%eax
  100797:	85 c0                	test   %eax,%eax
  100799:	74 97                	je     100732 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	39 c2                	cmp    %eax,%edx
  1007a3:	7c 46                	jl     1007eb <debuginfo_eip+0x2e2>
  1007a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	89 d0                	mov    %edx,%eax
  1007ac:	01 c0                	add    %eax,%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	c1 e0 02             	shl    $0x2,%eax
  1007b3:	89 c2                	mov    %eax,%edx
  1007b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b8:	01 d0                	add    %edx,%eax
  1007ba:	8b 10                	mov    (%eax),%edx
  1007bc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c2:	29 c1                	sub    %eax,%ecx
  1007c4:	89 c8                	mov    %ecx,%eax
  1007c6:	39 c2                	cmp    %eax,%edx
  1007c8:	73 21                	jae    1007eb <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	89 d0                	mov    %edx,%eax
  1007d1:	01 c0                	add    %eax,%eax
  1007d3:	01 d0                	add    %edx,%eax
  1007d5:	c1 e0 02             	shl    $0x2,%eax
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dd:	01 d0                	add    %edx,%eax
  1007df:	8b 10                	mov    (%eax),%edx
  1007e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e4:	01 c2                	add    %eax,%edx
  1007e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7d 4a                	jge    10083f <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	83 c0 01             	add    $0x1,%eax
  1007fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fe:	eb 18                	jmp    100818 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100800:	8b 45 0c             	mov    0xc(%ebp),%eax
  100803:	8b 40 14             	mov    0x14(%eax),%eax
  100806:	8d 50 01             	lea    0x1(%eax),%edx
  100809:	8b 45 0c             	mov    0xc(%ebp),%eax
  10080c:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10080f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100812:	83 c0 01             	add    $0x1,%eax
  100815:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100818:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10081e:	39 c2                	cmp    %eax,%edx
  100820:	7d 1d                	jge    10083f <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c a0                	cmp    $0xa0,%al
  10083d:	74 c1                	je     100800 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10083f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100844:	c9                   	leave  
  100845:	c3                   	ret    

00100846 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100846:	55                   	push   %ebp
  100847:	89 e5                	mov    %esp,%ebp
  100849:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10084c:	c7 04 24 96 35 10 00 	movl   $0x103596,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 af 35 10 00 	movl   $0x1035af,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 c9 34 10 	movl   $0x1034c9,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 c7 35 10 00 	movl   $0x1035c7,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 df 35 10 00 	movl   $0x1035df,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 f7 35 10 00 	movl   $0x1035f7,(%esp)
  1008a3:	e8 6a fa ff ff       	call   100312 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a8:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  1008ad:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008b8:	29 c2                	sub    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c2:	85 c0                	test   %eax,%eax
  1008c4:	0f 48 c2             	cmovs  %edx,%eax
  1008c7:	c1 f8 0a             	sar    $0xa,%eax
  1008ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ce:	c7 04 24 10 36 10 00 	movl   $0x103610,(%esp)
  1008d5:	e8 38 fa ff ff       	call   100312 <cprintf>
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ef:	89 04 24             	mov    %eax,(%esp)
  1008f2:	e8 12 fc ff ff       	call   100509 <debuginfo_eip>
  1008f7:	85 c0                	test   %eax,%eax
  1008f9:	74 15                	je     100910 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100902:	c7 04 24 3a 36 10 00 	movl   $0x10363a,(%esp)
  100909:	e8 04 fa ff ff       	call   100312 <cprintf>
  10090e:	eb 6d                	jmp    10097d <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100917:	eb 1c                	jmp    100935 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100919:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 00             	movzbl (%eax),%eax
  100924:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10092d:	01 ca                	add    %ecx,%edx
  10092f:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100931:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100935:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100938:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10093b:	7f dc                	jg     100919 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10093d:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10094b:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094e:	8b 55 08             	mov    0x8(%ebp),%edx
  100951:	89 d1                	mov    %edx,%ecx
  100953:	29 c1                	sub    %eax,%ecx
  100955:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100958:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  10095f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100965:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100969:	89 54 24 08          	mov    %edx,0x8(%esp)
  10096d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100971:	c7 04 24 56 36 10 00 	movl   $0x103656,(%esp)
  100978:	e8 95 f9 ff ff       	call   100312 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100985:	8b 45 04             	mov    0x4(%ebp),%eax
  100988:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10098b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098e:	c9                   	leave  
  10098f:	c3                   	ret    

00100990 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100996:	89 e8                	mov    %ebp,%eax
  100998:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  10099b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
	}
	cprintf("\n");
	print_debuginfo(c_eip - 1);
	c_eip = *((uint32_t*)c_ebp + 1);
	c_ebp = *((uint32_t*)c_ebp);}*/
    uint32_t ebp = read_ebp();
  10099e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    uint32_t eip = read_eip();
  1009a1:	e8 d9 ff ff ff       	call   10097f <read_eip>
  1009a6:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  1009a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009b0:	e9 82 00 00 00       	jmp    100a37 <print_stackframe+0xa7>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  1009b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009b8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009bf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c3:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  1009ca:	e8 43 f9 ff ff       	call   100312 <cprintf>
        //uint32_t *args = (uint32_t *)ebp + 2;
        for (j = 0; j < 4; j ++) {
  1009cf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1009d6:	eb 28                	jmp    100a00 <print_stackframe+0x70>
            cprintf("0x%08x ", *((uint32_t*) ebp + 2 + j));
  1009d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009db:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1009e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009e5:	01 d0                	add    %edx,%eax
  1009e7:	83 c0 08             	add    $0x8,%eax
  1009ea:	8b 00                	mov    (%eax),%eax
  1009ec:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f0:	c7 04 24 84 36 10 00 	movl   $0x103684,(%esp)
  1009f7:	e8 16 f9 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
        //uint32_t *args = (uint32_t *)ebp + 2;
        for (j = 0; j < 4; j ++) {
  1009fc:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a00:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100a04:	7e d2                	jle    1009d8 <print_stackframe+0x48>
            cprintf("0x%08x ", *((uint32_t*) ebp + 2 + j));
        }
        cprintf("\n");
  100a06:	c7 04 24 8c 36 10 00 	movl   $0x10368c,(%esp)
  100a0d:	e8 00 f9 ff ff       	call   100312 <cprintf>
        print_debuginfo(eip - 1);
  100a12:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a15:	83 e8 01             	sub    $0x1,%eax
  100a18:	89 04 24             	mov    %eax,(%esp)
  100a1b:	e8 bc fe ff ff       	call   1008dc <print_debuginfo>
        eip = *((uint32_t *)ebp + 1);
  100a20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a23:	83 c0 04             	add    $0x4,%eax
  100a26:	8b 00                	mov    (%eax),%eax
  100a28:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = *((uint32_t *)ebp);
  100a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a2e:	8b 00                	mov    (%eax),%eax
  100a30:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c_ebp = *((uint32_t*)c_ebp);}*/
    uint32_t ebp = read_ebp();
    uint32_t eip = read_eip();

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100a33:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100a37:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a3b:	74 0a                	je     100a47 <print_stackframe+0xb7>
  100a3d:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a41:	0f 8e 6e ff ff ff    	jle    1009b5 <print_stackframe+0x25>
        cprintf("\n");
        print_debuginfo(eip - 1);
        eip = *((uint32_t *)ebp + 1);
        ebp = *((uint32_t *)ebp);
    }
}
  100a47:	c9                   	leave  
  100a48:	c3                   	ret    

00100a49 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a49:	55                   	push   %ebp
  100a4a:	89 e5                	mov    %esp,%ebp
  100a4c:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a56:	eb 0c                	jmp    100a64 <parse+0x1b>
            *buf ++ = '\0';
  100a58:	8b 45 08             	mov    0x8(%ebp),%eax
  100a5b:	8d 50 01             	lea    0x1(%eax),%edx
  100a5e:	89 55 08             	mov    %edx,0x8(%ebp)
  100a61:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a64:	8b 45 08             	mov    0x8(%ebp),%eax
  100a67:	0f b6 00             	movzbl (%eax),%eax
  100a6a:	84 c0                	test   %al,%al
  100a6c:	74 1d                	je     100a8b <parse+0x42>
  100a6e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a71:	0f b6 00             	movzbl (%eax),%eax
  100a74:	0f be c0             	movsbl %al,%eax
  100a77:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a7b:	c7 04 24 10 37 10 00 	movl   $0x103710,(%esp)
  100a82:	e8 fa 26 00 00       	call   103181 <strchr>
  100a87:	85 c0                	test   %eax,%eax
  100a89:	75 cd                	jne    100a58 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a8b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a8e:	0f b6 00             	movzbl (%eax),%eax
  100a91:	84 c0                	test   %al,%al
  100a93:	75 02                	jne    100a97 <parse+0x4e>
            break;
  100a95:	eb 67                	jmp    100afe <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a97:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a9b:	75 14                	jne    100ab1 <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a9d:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100aa4:	00 
  100aa5:	c7 04 24 15 37 10 00 	movl   $0x103715,(%esp)
  100aac:	e8 61 f8 ff ff       	call   100312 <cprintf>
        }
        argv[argc ++] = buf;
  100ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab4:	8d 50 01             	lea    0x1(%eax),%edx
  100ab7:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100aba:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ac1:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ac4:	01 c2                	add    %eax,%edx
  100ac6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ac9:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100acb:	eb 04                	jmp    100ad1 <parse+0x88>
            buf ++;
  100acd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ad1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad4:	0f b6 00             	movzbl (%eax),%eax
  100ad7:	84 c0                	test   %al,%al
  100ad9:	74 1d                	je     100af8 <parse+0xaf>
  100adb:	8b 45 08             	mov    0x8(%ebp),%eax
  100ade:	0f b6 00             	movzbl (%eax),%eax
  100ae1:	0f be c0             	movsbl %al,%eax
  100ae4:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ae8:	c7 04 24 10 37 10 00 	movl   $0x103710,(%esp)
  100aef:	e8 8d 26 00 00       	call   103181 <strchr>
  100af4:	85 c0                	test   %eax,%eax
  100af6:	74 d5                	je     100acd <parse+0x84>
            buf ++;
        }
    }
  100af8:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100af9:	e9 66 ff ff ff       	jmp    100a64 <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100afe:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b01:	c9                   	leave  
  100b02:	c3                   	ret    

00100b03 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b03:	55                   	push   %ebp
  100b04:	89 e5                	mov    %esp,%ebp
  100b06:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b09:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b0c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b10:	8b 45 08             	mov    0x8(%ebp),%eax
  100b13:	89 04 24             	mov    %eax,(%esp)
  100b16:	e8 2e ff ff ff       	call   100a49 <parse>
  100b1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b1e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b22:	75 0a                	jne    100b2e <runcmd+0x2b>
        return 0;
  100b24:	b8 00 00 00 00       	mov    $0x0,%eax
  100b29:	e9 85 00 00 00       	jmp    100bb3 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b2e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b35:	eb 5c                	jmp    100b93 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b37:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b3d:	89 d0                	mov    %edx,%eax
  100b3f:	01 c0                	add    %eax,%eax
  100b41:	01 d0                	add    %edx,%eax
  100b43:	c1 e0 02             	shl    $0x2,%eax
  100b46:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b4b:	8b 00                	mov    (%eax),%eax
  100b4d:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b51:	89 04 24             	mov    %eax,(%esp)
  100b54:	e8 89 25 00 00       	call   1030e2 <strcmp>
  100b59:	85 c0                	test   %eax,%eax
  100b5b:	75 32                	jne    100b8f <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b5d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b60:	89 d0                	mov    %edx,%eax
  100b62:	01 c0                	add    %eax,%eax
  100b64:	01 d0                	add    %edx,%eax
  100b66:	c1 e0 02             	shl    $0x2,%eax
  100b69:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b6e:	8b 40 08             	mov    0x8(%eax),%eax
  100b71:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b74:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100b77:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b7a:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b7e:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100b81:	83 c2 04             	add    $0x4,%edx
  100b84:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b88:	89 0c 24             	mov    %ecx,(%esp)
  100b8b:	ff d0                	call   *%eax
  100b8d:	eb 24                	jmp    100bb3 <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b8f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b96:	83 f8 02             	cmp    $0x2,%eax
  100b99:	76 9c                	jbe    100b37 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b9b:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba2:	c7 04 24 33 37 10 00 	movl   $0x103733,(%esp)
  100ba9:	e8 64 f7 ff ff       	call   100312 <cprintf>
    return 0;
  100bae:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bb3:	c9                   	leave  
  100bb4:	c3                   	ret    

00100bb5 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bb5:	55                   	push   %ebp
  100bb6:	89 e5                	mov    %esp,%ebp
  100bb8:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bbb:	c7 04 24 4c 37 10 00 	movl   $0x10374c,(%esp)
  100bc2:	e8 4b f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bc7:	c7 04 24 74 37 10 00 	movl   $0x103774,(%esp)
  100bce:	e8 3f f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100bd3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bd7:	74 0b                	je     100be4 <kmonitor+0x2f>
        print_trapframe(tf);
  100bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  100bdc:	89 04 24             	mov    %eax,(%esp)
  100bdf:	e8 21 0e 00 00       	call   101a05 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100be4:	c7 04 24 99 37 10 00 	movl   $0x103799,(%esp)
  100beb:	e8 19 f6 ff ff       	call   100209 <readline>
  100bf0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bf3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bf7:	74 18                	je     100c11 <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100bf9:	8b 45 08             	mov    0x8(%ebp),%eax
  100bfc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c00:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c03:	89 04 24             	mov    %eax,(%esp)
  100c06:	e8 f8 fe ff ff       	call   100b03 <runcmd>
  100c0b:	85 c0                	test   %eax,%eax
  100c0d:	79 02                	jns    100c11 <kmonitor+0x5c>
                break;
  100c0f:	eb 02                	jmp    100c13 <kmonitor+0x5e>
            }
        }
    }
  100c11:	eb d1                	jmp    100be4 <kmonitor+0x2f>
}
  100c13:	c9                   	leave  
  100c14:	c3                   	ret    

00100c15 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c15:	55                   	push   %ebp
  100c16:	89 e5                	mov    %esp,%ebp
  100c18:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c22:	eb 3f                	jmp    100c63 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c24:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c27:	89 d0                	mov    %edx,%eax
  100c29:	01 c0                	add    %eax,%eax
  100c2b:	01 d0                	add    %edx,%eax
  100c2d:	c1 e0 02             	shl    $0x2,%eax
  100c30:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c35:	8b 48 04             	mov    0x4(%eax),%ecx
  100c38:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c3b:	89 d0                	mov    %edx,%eax
  100c3d:	01 c0                	add    %eax,%eax
  100c3f:	01 d0                	add    %edx,%eax
  100c41:	c1 e0 02             	shl    $0x2,%eax
  100c44:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c49:	8b 00                	mov    (%eax),%eax
  100c4b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c53:	c7 04 24 9d 37 10 00 	movl   $0x10379d,(%esp)
  100c5a:	e8 b3 f6 ff ff       	call   100312 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c5f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c66:	83 f8 02             	cmp    $0x2,%eax
  100c69:	76 b9                	jbe    100c24 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c6b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c70:	c9                   	leave  
  100c71:	c3                   	ret    

00100c72 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c72:	55                   	push   %ebp
  100c73:	89 e5                	mov    %esp,%ebp
  100c75:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c78:	e8 c9 fb ff ff       	call   100846 <print_kerninfo>
    return 0;
  100c7d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c82:	c9                   	leave  
  100c83:	c3                   	ret    

00100c84 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c84:	55                   	push   %ebp
  100c85:	89 e5                	mov    %esp,%ebp
  100c87:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c8a:	e8 01 fd ff ff       	call   100990 <print_stackframe>
    return 0;
  100c8f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c94:	c9                   	leave  
  100c95:	c3                   	ret    

00100c96 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c96:	55                   	push   %ebp
  100c97:	89 e5                	mov    %esp,%ebp
  100c99:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100c9c:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100ca1:	85 c0                	test   %eax,%eax
  100ca3:	74 02                	je     100ca7 <__panic+0x11>
        goto panic_dead;
  100ca5:	eb 48                	jmp    100cef <__panic+0x59>
    }
    is_panic = 1;
  100ca7:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100cae:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cb1:	8d 45 14             	lea    0x14(%ebp),%eax
  100cb4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cb7:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cba:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cbe:	8b 45 08             	mov    0x8(%ebp),%eax
  100cc1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc5:	c7 04 24 a6 37 10 00 	movl   $0x1037a6,(%esp)
  100ccc:	e8 41 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100cd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd4:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cd8:	8b 45 10             	mov    0x10(%ebp),%eax
  100cdb:	89 04 24             	mov    %eax,(%esp)
  100cde:	e8 fc f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100ce3:	c7 04 24 c2 37 10 00 	movl   $0x1037c2,(%esp)
  100cea:	e8 23 f6 ff ff       	call   100312 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100cef:	e8 22 09 00 00       	call   101616 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100cf4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100cfb:	e8 b5 fe ff ff       	call   100bb5 <kmonitor>
    }
  100d00:	eb f2                	jmp    100cf4 <__panic+0x5e>

00100d02 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d02:	55                   	push   %ebp
  100d03:	89 e5                	mov    %esp,%ebp
  100d05:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d08:	8d 45 14             	lea    0x14(%ebp),%eax
  100d0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d0e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d11:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d15:	8b 45 08             	mov    0x8(%ebp),%eax
  100d18:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d1c:	c7 04 24 c4 37 10 00 	movl   $0x1037c4,(%esp)
  100d23:	e8 ea f5 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100d28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d2b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d2f:	8b 45 10             	mov    0x10(%ebp),%eax
  100d32:	89 04 24             	mov    %eax,(%esp)
  100d35:	e8 a5 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d3a:	c7 04 24 c2 37 10 00 	movl   $0x1037c2,(%esp)
  100d41:	e8 cc f5 ff ff       	call   100312 <cprintf>
    va_end(ap);
}
  100d46:	c9                   	leave  
  100d47:	c3                   	ret    

00100d48 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d48:	55                   	push   %ebp
  100d49:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d4b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d50:	5d                   	pop    %ebp
  100d51:	c3                   	ret    

00100d52 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d52:	55                   	push   %ebp
  100d53:	89 e5                	mov    %esp,%ebp
  100d55:	83 ec 28             	sub    $0x28,%esp
  100d58:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d5e:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d62:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d66:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d6a:	ee                   	out    %al,(%dx)
  100d6b:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d71:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d75:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d79:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d7d:	ee                   	out    %al,(%dx)
  100d7e:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d84:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d88:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d8c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d90:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d91:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d98:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d9b:	c7 04 24 e2 37 10 00 	movl   $0x1037e2,(%esp)
  100da2:	e8 6b f5 ff ff       	call   100312 <cprintf>
    pic_enable(IRQ_TIMER);
  100da7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dae:	e8 c1 08 00 00       	call   101674 <pic_enable>
}
  100db3:	c9                   	leave  
  100db4:	c3                   	ret    

00100db5 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100db5:	55                   	push   %ebp
  100db6:	89 e5                	mov    %esp,%ebp
  100db8:	83 ec 10             	sub    $0x10,%esp
  100dbb:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dc1:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dc5:	89 c2                	mov    %eax,%edx
  100dc7:	ec                   	in     (%dx),%al
  100dc8:	88 45 fd             	mov    %al,-0x3(%ebp)
  100dcb:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dd1:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dd5:	89 c2                	mov    %eax,%edx
  100dd7:	ec                   	in     (%dx),%al
  100dd8:	88 45 f9             	mov    %al,-0x7(%ebp)
  100ddb:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100de1:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100de5:	89 c2                	mov    %eax,%edx
  100de7:	ec                   	in     (%dx),%al
  100de8:	88 45 f5             	mov    %al,-0xb(%ebp)
  100deb:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100df1:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100df5:	89 c2                	mov    %eax,%edx
  100df7:	ec                   	in     (%dx),%al
  100df8:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dfb:	c9                   	leave  
  100dfc:	c3                   	ret    

00100dfd <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100dfd:	55                   	push   %ebp
  100dfe:	89 e5                	mov    %esp,%ebp
  100e00:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e03:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100e0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e0d:	0f b7 00             	movzwl (%eax),%eax
  100e10:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e14:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e17:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e1f:	0f b7 00             	movzwl (%eax),%eax
  100e22:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e26:	74 12                	je     100e3a <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100e28:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100e2f:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e36:	b4 03 
  100e38:	eb 13                	jmp    100e4d <cga_init+0x50>
    } else {
        *cp = was;
  100e3a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e3d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e41:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e44:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e4b:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e4d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e54:	0f b7 c0             	movzwl %ax,%eax
  100e57:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e5b:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e5f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e63:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e67:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e68:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e6f:	83 c0 01             	add    $0x1,%eax
  100e72:	0f b7 c0             	movzwl %ax,%eax
  100e75:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e79:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e7d:	89 c2                	mov    %eax,%edx
  100e7f:	ec                   	in     (%dx),%al
  100e80:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e83:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e87:	0f b6 c0             	movzbl %al,%eax
  100e8a:	c1 e0 08             	shl    $0x8,%eax
  100e8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e90:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e97:	0f b7 c0             	movzwl %ax,%eax
  100e9a:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100e9e:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ea2:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ea6:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100eaa:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100eab:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eb2:	83 c0 01             	add    $0x1,%eax
  100eb5:	0f b7 c0             	movzwl %ax,%eax
  100eb8:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ebc:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ec0:	89 c2                	mov    %eax,%edx
  100ec2:	ec                   	in     (%dx),%al
  100ec3:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100ec6:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100eca:	0f b6 c0             	movzbl %al,%eax
  100ecd:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100ed0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ed3:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100ed8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100edb:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ee1:	c9                   	leave  
  100ee2:	c3                   	ret    

00100ee3 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ee3:	55                   	push   %ebp
  100ee4:	89 e5                	mov    %esp,%ebp
  100ee6:	83 ec 48             	sub    $0x48,%esp
  100ee9:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100eef:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ef3:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100ef7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100efb:	ee                   	out    %al,(%dx)
  100efc:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f02:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f06:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f0a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f0e:	ee                   	out    %al,(%dx)
  100f0f:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f15:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f19:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f1d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f21:	ee                   	out    %al,(%dx)
  100f22:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f28:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f2c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f30:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f34:	ee                   	out    %al,(%dx)
  100f35:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f3b:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f3f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f43:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f47:	ee                   	out    %al,(%dx)
  100f48:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f4e:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f52:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f56:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f5a:	ee                   	out    %al,(%dx)
  100f5b:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f61:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f65:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f69:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f6d:	ee                   	out    %al,(%dx)
  100f6e:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f74:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f78:	89 c2                	mov    %eax,%edx
  100f7a:	ec                   	in     (%dx),%al
  100f7b:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f7e:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f82:	3c ff                	cmp    $0xff,%al
  100f84:	0f 95 c0             	setne  %al
  100f87:	0f b6 c0             	movzbl %al,%eax
  100f8a:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f8f:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f95:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100f99:	89 c2                	mov    %eax,%edx
  100f9b:	ec                   	in     (%dx),%al
  100f9c:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100f9f:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fa5:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fa9:	89 c2                	mov    %eax,%edx
  100fab:	ec                   	in     (%dx),%al
  100fac:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100faf:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fb4:	85 c0                	test   %eax,%eax
  100fb6:	74 0c                	je     100fc4 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fb8:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fbf:	e8 b0 06 00 00       	call   101674 <pic_enable>
    }
}
  100fc4:	c9                   	leave  
  100fc5:	c3                   	ret    

00100fc6 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fc6:	55                   	push   %ebp
  100fc7:	89 e5                	mov    %esp,%ebp
  100fc9:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fcc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fd3:	eb 09                	jmp    100fde <lpt_putc_sub+0x18>
        delay();
  100fd5:	e8 db fd ff ff       	call   100db5 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fda:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fde:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fe4:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fe8:	89 c2                	mov    %eax,%edx
  100fea:	ec                   	in     (%dx),%al
  100feb:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fee:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100ff2:	84 c0                	test   %al,%al
  100ff4:	78 09                	js     100fff <lpt_putc_sub+0x39>
  100ff6:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100ffd:	7e d6                	jle    100fd5 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fff:	8b 45 08             	mov    0x8(%ebp),%eax
  101002:	0f b6 c0             	movzbl %al,%eax
  101005:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  10100b:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10100e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101012:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101016:	ee                   	out    %al,(%dx)
  101017:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10101d:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101021:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101025:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101029:	ee                   	out    %al,(%dx)
  10102a:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  101030:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  101034:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101038:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10103c:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10103d:	c9                   	leave  
  10103e:	c3                   	ret    

0010103f <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10103f:	55                   	push   %ebp
  101040:	89 e5                	mov    %esp,%ebp
  101042:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101045:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101049:	74 0d                	je     101058 <lpt_putc+0x19>
        lpt_putc_sub(c);
  10104b:	8b 45 08             	mov    0x8(%ebp),%eax
  10104e:	89 04 24             	mov    %eax,(%esp)
  101051:	e8 70 ff ff ff       	call   100fc6 <lpt_putc_sub>
  101056:	eb 24                	jmp    10107c <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101058:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10105f:	e8 62 ff ff ff       	call   100fc6 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101064:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10106b:	e8 56 ff ff ff       	call   100fc6 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101070:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101077:	e8 4a ff ff ff       	call   100fc6 <lpt_putc_sub>
    }
}
  10107c:	c9                   	leave  
  10107d:	c3                   	ret    

0010107e <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10107e:	55                   	push   %ebp
  10107f:	89 e5                	mov    %esp,%ebp
  101081:	53                   	push   %ebx
  101082:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101085:	8b 45 08             	mov    0x8(%ebp),%eax
  101088:	b0 00                	mov    $0x0,%al
  10108a:	85 c0                	test   %eax,%eax
  10108c:	75 07                	jne    101095 <cga_putc+0x17>
        c |= 0x0700;
  10108e:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101095:	8b 45 08             	mov    0x8(%ebp),%eax
  101098:	0f b6 c0             	movzbl %al,%eax
  10109b:	83 f8 0a             	cmp    $0xa,%eax
  10109e:	74 4c                	je     1010ec <cga_putc+0x6e>
  1010a0:	83 f8 0d             	cmp    $0xd,%eax
  1010a3:	74 57                	je     1010fc <cga_putc+0x7e>
  1010a5:	83 f8 08             	cmp    $0x8,%eax
  1010a8:	0f 85 88 00 00 00    	jne    101136 <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010ae:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010b5:	66 85 c0             	test   %ax,%ax
  1010b8:	74 30                	je     1010ea <cga_putc+0x6c>
            crt_pos --;
  1010ba:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c1:	83 e8 01             	sub    $0x1,%eax
  1010c4:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010ca:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010cf:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010d6:	0f b7 d2             	movzwl %dx,%edx
  1010d9:	01 d2                	add    %edx,%edx
  1010db:	01 c2                	add    %eax,%edx
  1010dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1010e0:	b0 00                	mov    $0x0,%al
  1010e2:	83 c8 20             	or     $0x20,%eax
  1010e5:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010e8:	eb 72                	jmp    10115c <cga_putc+0xde>
  1010ea:	eb 70                	jmp    10115c <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  1010ec:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010f3:	83 c0 50             	add    $0x50,%eax
  1010f6:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010fc:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101103:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  10110a:	0f b7 c1             	movzwl %cx,%eax
  10110d:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101113:	c1 e8 10             	shr    $0x10,%eax
  101116:	89 c2                	mov    %eax,%edx
  101118:	66 c1 ea 06          	shr    $0x6,%dx
  10111c:	89 d0                	mov    %edx,%eax
  10111e:	c1 e0 02             	shl    $0x2,%eax
  101121:	01 d0                	add    %edx,%eax
  101123:	c1 e0 04             	shl    $0x4,%eax
  101126:	29 c1                	sub    %eax,%ecx
  101128:	89 ca                	mov    %ecx,%edx
  10112a:	89 d8                	mov    %ebx,%eax
  10112c:	29 d0                	sub    %edx,%eax
  10112e:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101134:	eb 26                	jmp    10115c <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101136:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10113c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101143:	8d 50 01             	lea    0x1(%eax),%edx
  101146:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10114d:	0f b7 c0             	movzwl %ax,%eax
  101150:	01 c0                	add    %eax,%eax
  101152:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101155:	8b 45 08             	mov    0x8(%ebp),%eax
  101158:	66 89 02             	mov    %ax,(%edx)
        break;
  10115b:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10115c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101163:	66 3d cf 07          	cmp    $0x7cf,%ax
  101167:	76 5b                	jbe    1011c4 <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101169:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10116e:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101174:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101179:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101180:	00 
  101181:	89 54 24 04          	mov    %edx,0x4(%esp)
  101185:	89 04 24             	mov    %eax,(%esp)
  101188:	e8 f2 21 00 00       	call   10337f <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10118d:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101194:	eb 15                	jmp    1011ab <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  101196:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10119b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10119e:	01 d2                	add    %edx,%edx
  1011a0:	01 d0                	add    %edx,%eax
  1011a2:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011ab:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011b2:	7e e2                	jle    101196 <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011b4:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011bb:	83 e8 50             	sub    $0x50,%eax
  1011be:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011c4:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011cb:	0f b7 c0             	movzwl %ax,%eax
  1011ce:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011d2:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011d6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011da:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011de:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011df:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011e6:	66 c1 e8 08          	shr    $0x8,%ax
  1011ea:	0f b6 c0             	movzbl %al,%eax
  1011ed:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011f4:	83 c2 01             	add    $0x1,%edx
  1011f7:	0f b7 d2             	movzwl %dx,%edx
  1011fa:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  1011fe:	88 45 ed             	mov    %al,-0x13(%ebp)
  101201:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101205:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101209:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  10120a:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101211:	0f b7 c0             	movzwl %ax,%eax
  101214:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101218:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  10121c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101220:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101224:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101225:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10122c:	0f b6 c0             	movzbl %al,%eax
  10122f:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101236:	83 c2 01             	add    $0x1,%edx
  101239:	0f b7 d2             	movzwl %dx,%edx
  10123c:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101240:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101243:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101247:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10124b:	ee                   	out    %al,(%dx)
}
  10124c:	83 c4 34             	add    $0x34,%esp
  10124f:	5b                   	pop    %ebx
  101250:	5d                   	pop    %ebp
  101251:	c3                   	ret    

00101252 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101252:	55                   	push   %ebp
  101253:	89 e5                	mov    %esp,%ebp
  101255:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10125f:	eb 09                	jmp    10126a <serial_putc_sub+0x18>
        delay();
  101261:	e8 4f fb ff ff       	call   100db5 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101266:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10126a:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101270:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101274:	89 c2                	mov    %eax,%edx
  101276:	ec                   	in     (%dx),%al
  101277:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10127a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10127e:	0f b6 c0             	movzbl %al,%eax
  101281:	83 e0 20             	and    $0x20,%eax
  101284:	85 c0                	test   %eax,%eax
  101286:	75 09                	jne    101291 <serial_putc_sub+0x3f>
  101288:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10128f:	7e d0                	jle    101261 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  101291:	8b 45 08             	mov    0x8(%ebp),%eax
  101294:	0f b6 c0             	movzbl %al,%eax
  101297:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10129d:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012a0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012a4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012a8:	ee                   	out    %al,(%dx)
}
  1012a9:	c9                   	leave  
  1012aa:	c3                   	ret    

001012ab <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012ab:	55                   	push   %ebp
  1012ac:	89 e5                	mov    %esp,%ebp
  1012ae:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012b1:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012b5:	74 0d                	je     1012c4 <serial_putc+0x19>
        serial_putc_sub(c);
  1012b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ba:	89 04 24             	mov    %eax,(%esp)
  1012bd:	e8 90 ff ff ff       	call   101252 <serial_putc_sub>
  1012c2:	eb 24                	jmp    1012e8 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012c4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012cb:	e8 82 ff ff ff       	call   101252 <serial_putc_sub>
        serial_putc_sub(' ');
  1012d0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012d7:	e8 76 ff ff ff       	call   101252 <serial_putc_sub>
        serial_putc_sub('\b');
  1012dc:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012e3:	e8 6a ff ff ff       	call   101252 <serial_putc_sub>
    }
}
  1012e8:	c9                   	leave  
  1012e9:	c3                   	ret    

001012ea <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012ea:	55                   	push   %ebp
  1012eb:	89 e5                	mov    %esp,%ebp
  1012ed:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012f0:	eb 33                	jmp    101325 <cons_intr+0x3b>
        if (c != 0) {
  1012f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012f6:	74 2d                	je     101325 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012f8:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012fd:	8d 50 01             	lea    0x1(%eax),%edx
  101300:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101306:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101309:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10130f:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101314:	3d 00 02 00 00       	cmp    $0x200,%eax
  101319:	75 0a                	jne    101325 <cons_intr+0x3b>
                cons.wpos = 0;
  10131b:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101322:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101325:	8b 45 08             	mov    0x8(%ebp),%eax
  101328:	ff d0                	call   *%eax
  10132a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10132d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101331:	75 bf                	jne    1012f2 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101333:	c9                   	leave  
  101334:	c3                   	ret    

00101335 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101335:	55                   	push   %ebp
  101336:	89 e5                	mov    %esp,%ebp
  101338:	83 ec 10             	sub    $0x10,%esp
  10133b:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101341:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101345:	89 c2                	mov    %eax,%edx
  101347:	ec                   	in     (%dx),%al
  101348:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10134b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10134f:	0f b6 c0             	movzbl %al,%eax
  101352:	83 e0 01             	and    $0x1,%eax
  101355:	85 c0                	test   %eax,%eax
  101357:	75 07                	jne    101360 <serial_proc_data+0x2b>
        return -1;
  101359:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10135e:	eb 2a                	jmp    10138a <serial_proc_data+0x55>
  101360:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101366:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10136a:	89 c2                	mov    %eax,%edx
  10136c:	ec                   	in     (%dx),%al
  10136d:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101370:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101374:	0f b6 c0             	movzbl %al,%eax
  101377:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10137a:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10137e:	75 07                	jne    101387 <serial_proc_data+0x52>
        c = '\b';
  101380:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101387:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10138a:	c9                   	leave  
  10138b:	c3                   	ret    

0010138c <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10138c:	55                   	push   %ebp
  10138d:	89 e5                	mov    %esp,%ebp
  10138f:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  101392:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101397:	85 c0                	test   %eax,%eax
  101399:	74 0c                	je     1013a7 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  10139b:	c7 04 24 35 13 10 00 	movl   $0x101335,(%esp)
  1013a2:	e8 43 ff ff ff       	call   1012ea <cons_intr>
    }
}
  1013a7:	c9                   	leave  
  1013a8:	c3                   	ret    

001013a9 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013a9:	55                   	push   %ebp
  1013aa:	89 e5                	mov    %esp,%ebp
  1013ac:	83 ec 38             	sub    $0x38,%esp
  1013af:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013b5:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013b9:	89 c2                	mov    %eax,%edx
  1013bb:	ec                   	in     (%dx),%al
  1013bc:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013bf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013c3:	0f b6 c0             	movzbl %al,%eax
  1013c6:	83 e0 01             	and    $0x1,%eax
  1013c9:	85 c0                	test   %eax,%eax
  1013cb:	75 0a                	jne    1013d7 <kbd_proc_data+0x2e>
        return -1;
  1013cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013d2:	e9 59 01 00 00       	jmp    101530 <kbd_proc_data+0x187>
  1013d7:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013dd:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013e1:	89 c2                	mov    %eax,%edx
  1013e3:	ec                   	in     (%dx),%al
  1013e4:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013e7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013eb:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013ee:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013f2:	75 17                	jne    10140b <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013f4:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013f9:	83 c8 40             	or     $0x40,%eax
  1013fc:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101401:	b8 00 00 00 00       	mov    $0x0,%eax
  101406:	e9 25 01 00 00       	jmp    101530 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  10140b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10140f:	84 c0                	test   %al,%al
  101411:	79 47                	jns    10145a <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101413:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101418:	83 e0 40             	and    $0x40,%eax
  10141b:	85 c0                	test   %eax,%eax
  10141d:	75 09                	jne    101428 <kbd_proc_data+0x7f>
  10141f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101423:	83 e0 7f             	and    $0x7f,%eax
  101426:	eb 04                	jmp    10142c <kbd_proc_data+0x83>
  101428:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10142c:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10142f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101433:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10143a:	83 c8 40             	or     $0x40,%eax
  10143d:	0f b6 c0             	movzbl %al,%eax
  101440:	f7 d0                	not    %eax
  101442:	89 c2                	mov    %eax,%edx
  101444:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101449:	21 d0                	and    %edx,%eax
  10144b:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101450:	b8 00 00 00 00       	mov    $0x0,%eax
  101455:	e9 d6 00 00 00       	jmp    101530 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  10145a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10145f:	83 e0 40             	and    $0x40,%eax
  101462:	85 c0                	test   %eax,%eax
  101464:	74 11                	je     101477 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101466:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10146a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10146f:	83 e0 bf             	and    $0xffffffbf,%eax
  101472:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101477:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10147b:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101482:	0f b6 d0             	movzbl %al,%edx
  101485:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10148a:	09 d0                	or     %edx,%eax
  10148c:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  101491:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101495:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  10149c:	0f b6 d0             	movzbl %al,%edx
  10149f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014a4:	31 d0                	xor    %edx,%eax
  1014a6:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014ab:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b0:	83 e0 03             	and    $0x3,%eax
  1014b3:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014ba:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014be:	01 d0                	add    %edx,%eax
  1014c0:	0f b6 00             	movzbl (%eax),%eax
  1014c3:	0f b6 c0             	movzbl %al,%eax
  1014c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014c9:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ce:	83 e0 08             	and    $0x8,%eax
  1014d1:	85 c0                	test   %eax,%eax
  1014d3:	74 22                	je     1014f7 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014d5:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014d9:	7e 0c                	jle    1014e7 <kbd_proc_data+0x13e>
  1014db:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014df:	7f 06                	jg     1014e7 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014e1:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014e5:	eb 10                	jmp    1014f7 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014e7:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014eb:	7e 0a                	jle    1014f7 <kbd_proc_data+0x14e>
  1014ed:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014f1:	7f 04                	jg     1014f7 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014f3:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014f7:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014fc:	f7 d0                	not    %eax
  1014fe:	83 e0 06             	and    $0x6,%eax
  101501:	85 c0                	test   %eax,%eax
  101503:	75 28                	jne    10152d <kbd_proc_data+0x184>
  101505:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10150c:	75 1f                	jne    10152d <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  10150e:	c7 04 24 fd 37 10 00 	movl   $0x1037fd,(%esp)
  101515:	e8 f8 ed ff ff       	call   100312 <cprintf>
  10151a:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101520:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101524:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101528:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  10152c:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10152d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101530:	c9                   	leave  
  101531:	c3                   	ret    

00101532 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101532:	55                   	push   %ebp
  101533:	89 e5                	mov    %esp,%ebp
  101535:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101538:	c7 04 24 a9 13 10 00 	movl   $0x1013a9,(%esp)
  10153f:	e8 a6 fd ff ff       	call   1012ea <cons_intr>
}
  101544:	c9                   	leave  
  101545:	c3                   	ret    

00101546 <kbd_init>:

static void
kbd_init(void) {
  101546:	55                   	push   %ebp
  101547:	89 e5                	mov    %esp,%ebp
  101549:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10154c:	e8 e1 ff ff ff       	call   101532 <kbd_intr>
    pic_enable(IRQ_KBD);
  101551:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101558:	e8 17 01 00 00       	call   101674 <pic_enable>
}
  10155d:	c9                   	leave  
  10155e:	c3                   	ret    

0010155f <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10155f:	55                   	push   %ebp
  101560:	89 e5                	mov    %esp,%ebp
  101562:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101565:	e8 93 f8 ff ff       	call   100dfd <cga_init>
    serial_init();
  10156a:	e8 74 f9 ff ff       	call   100ee3 <serial_init>
    kbd_init();
  10156f:	e8 d2 ff ff ff       	call   101546 <kbd_init>
    if (!serial_exists) {
  101574:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101579:	85 c0                	test   %eax,%eax
  10157b:	75 0c                	jne    101589 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10157d:	c7 04 24 09 38 10 00 	movl   $0x103809,(%esp)
  101584:	e8 89 ed ff ff       	call   100312 <cprintf>
    }
}
  101589:	c9                   	leave  
  10158a:	c3                   	ret    

0010158b <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10158b:	55                   	push   %ebp
  10158c:	89 e5                	mov    %esp,%ebp
  10158e:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101591:	8b 45 08             	mov    0x8(%ebp),%eax
  101594:	89 04 24             	mov    %eax,(%esp)
  101597:	e8 a3 fa ff ff       	call   10103f <lpt_putc>
    cga_putc(c);
  10159c:	8b 45 08             	mov    0x8(%ebp),%eax
  10159f:	89 04 24             	mov    %eax,(%esp)
  1015a2:	e8 d7 fa ff ff       	call   10107e <cga_putc>
    serial_putc(c);
  1015a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1015aa:	89 04 24             	mov    %eax,(%esp)
  1015ad:	e8 f9 fc ff ff       	call   1012ab <serial_putc>
}
  1015b2:	c9                   	leave  
  1015b3:	c3                   	ret    

001015b4 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015b4:	55                   	push   %ebp
  1015b5:	89 e5                	mov    %esp,%ebp
  1015b7:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015ba:	e8 cd fd ff ff       	call   10138c <serial_intr>
    kbd_intr();
  1015bf:	e8 6e ff ff ff       	call   101532 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015c4:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015ca:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015cf:	39 c2                	cmp    %eax,%edx
  1015d1:	74 36                	je     101609 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015d3:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015d8:	8d 50 01             	lea    0x1(%eax),%edx
  1015db:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015e1:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015e8:	0f b6 c0             	movzbl %al,%eax
  1015eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015ee:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015f3:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015f8:	75 0a                	jne    101604 <cons_getc+0x50>
            cons.rpos = 0;
  1015fa:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101601:	00 00 00 
        }
        return c;
  101604:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101607:	eb 05                	jmp    10160e <cons_getc+0x5a>
    }
    return 0;
  101609:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10160e:	c9                   	leave  
  10160f:	c3                   	ret    

00101610 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101610:	55                   	push   %ebp
  101611:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101613:	fb                   	sti    
    sti();
}
  101614:	5d                   	pop    %ebp
  101615:	c3                   	ret    

00101616 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101616:	55                   	push   %ebp
  101617:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101619:	fa                   	cli    
    cli();
}
  10161a:	5d                   	pop    %ebp
  10161b:	c3                   	ret    

0010161c <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10161c:	55                   	push   %ebp
  10161d:	89 e5                	mov    %esp,%ebp
  10161f:	83 ec 14             	sub    $0x14,%esp
  101622:	8b 45 08             	mov    0x8(%ebp),%eax
  101625:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101629:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10162d:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101633:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101638:	85 c0                	test   %eax,%eax
  10163a:	74 36                	je     101672 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  10163c:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101640:	0f b6 c0             	movzbl %al,%eax
  101643:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101649:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10164c:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101650:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101654:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101655:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101659:	66 c1 e8 08          	shr    $0x8,%ax
  10165d:	0f b6 c0             	movzbl %al,%eax
  101660:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101666:	88 45 f9             	mov    %al,-0x7(%ebp)
  101669:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10166d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101671:	ee                   	out    %al,(%dx)
    }
}
  101672:	c9                   	leave  
  101673:	c3                   	ret    

00101674 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101674:	55                   	push   %ebp
  101675:	89 e5                	mov    %esp,%ebp
  101677:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10167a:	8b 45 08             	mov    0x8(%ebp),%eax
  10167d:	ba 01 00 00 00       	mov    $0x1,%edx
  101682:	89 c1                	mov    %eax,%ecx
  101684:	d3 e2                	shl    %cl,%edx
  101686:	89 d0                	mov    %edx,%eax
  101688:	f7 d0                	not    %eax
  10168a:	89 c2                	mov    %eax,%edx
  10168c:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101693:	21 d0                	and    %edx,%eax
  101695:	0f b7 c0             	movzwl %ax,%eax
  101698:	89 04 24             	mov    %eax,(%esp)
  10169b:	e8 7c ff ff ff       	call   10161c <pic_setmask>
}
  1016a0:	c9                   	leave  
  1016a1:	c3                   	ret    

001016a2 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016a2:	55                   	push   %ebp
  1016a3:	89 e5                	mov    %esp,%ebp
  1016a5:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016a8:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016af:	00 00 00 
  1016b2:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016b8:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016bc:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016c0:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016c4:	ee                   	out    %al,(%dx)
  1016c5:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016cb:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016cf:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016d3:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016d7:	ee                   	out    %al,(%dx)
  1016d8:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016de:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016e2:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016e6:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016ea:	ee                   	out    %al,(%dx)
  1016eb:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016f1:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  1016f5:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1016f9:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1016fd:	ee                   	out    %al,(%dx)
  1016fe:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  101704:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101708:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10170c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101710:	ee                   	out    %al,(%dx)
  101711:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101717:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  10171b:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10171f:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101723:	ee                   	out    %al,(%dx)
  101724:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  10172a:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  10172e:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101732:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101736:	ee                   	out    %al,(%dx)
  101737:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  10173d:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  101741:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101745:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101749:	ee                   	out    %al,(%dx)
  10174a:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  101750:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  101754:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101758:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10175c:	ee                   	out    %al,(%dx)
  10175d:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  101763:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101767:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10176b:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10176f:	ee                   	out    %al,(%dx)
  101770:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101776:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  10177a:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10177e:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101782:	ee                   	out    %al,(%dx)
  101783:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101789:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  10178d:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101791:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101795:	ee                   	out    %al,(%dx)
  101796:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  10179c:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017a0:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017a4:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017a8:	ee                   	out    %al,(%dx)
  1017a9:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017af:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017b3:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017b7:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017bb:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017bc:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017c3:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017c7:	74 12                	je     1017db <pic_init+0x139>
        pic_setmask(irq_mask);
  1017c9:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017d0:	0f b7 c0             	movzwl %ax,%eax
  1017d3:	89 04 24             	mov    %eax,(%esp)
  1017d6:	e8 41 fe ff ff       	call   10161c <pic_setmask>
    }
}
  1017db:	c9                   	leave  
  1017dc:	c3                   	ret    

001017dd <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017dd:	55                   	push   %ebp
  1017de:	89 e5                	mov    %esp,%ebp
  1017e0:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017e3:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1017ea:	00 
  1017eb:	c7 04 24 40 38 10 00 	movl   $0x103840,(%esp)
  1017f2:	e8 1b eb ff ff       	call   100312 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1017f7:	c9                   	leave  
  1017f8:	c3                   	ret    

001017f9 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1017f9:	55                   	push   %ebp
  1017fa:	89 e5                	mov    %esp,%ebp
  1017fc:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i;
	for(i = 0; i < 256; ++i){
  1017ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101806:	e9 97 01 00 00       	jmp    1019a2 <idt_init+0x1a9>
	if(i == T_SYSCALL || i == T_SWITCH_TOK){
  10180b:	81 7d fc 80 00 00 00 	cmpl   $0x80,-0x4(%ebp)
  101812:	74 0a                	je     10181e <idt_init+0x25>
  101814:	83 7d fc 79          	cmpl   $0x79,-0x4(%ebp)
  101818:	0f 85 c1 00 00 00    	jne    1018df <idt_init+0xe6>
	SETGATE(idt[i], 1, KERNEL_CS, __vectors[i], DPL_USER);
  10181e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101821:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101828:	89 c2                	mov    %eax,%edx
  10182a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10182d:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101834:	00 
  101835:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101838:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  10183f:	00 08 00 
  101842:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101845:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10184c:	00 
  10184d:	83 e2 e0             	and    $0xffffffe0,%edx
  101850:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101857:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10185a:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101861:	00 
  101862:	83 e2 1f             	and    $0x1f,%edx
  101865:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10186c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10186f:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101876:	00 
  101877:	83 ca 0f             	or     $0xf,%edx
  10187a:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101881:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101884:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10188b:	00 
  10188c:	83 e2 ef             	and    $0xffffffef,%edx
  10188f:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101896:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101899:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018a0:	00 
  1018a1:	83 ca 60             	or     $0x60,%edx
  1018a4:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ae:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018b5:	00 
  1018b6:	83 ca 80             	or     $0xffffff80,%edx
  1018b9:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c3:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018ca:	c1 e8 10             	shr    $0x10,%eax
  1018cd:	89 c2                	mov    %eax,%edx
  1018cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d2:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018d9:	00 
  1018da:	e9 bf 00 00 00       	jmp    10199e <idt_init+0x1a5>
}
	else{
	SETGATE(idt[i], 0, KERNEL_CS, __vectors[i], DPL_KERNEL);
  1018df:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018e2:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018e9:	89 c2                	mov    %eax,%edx
  1018eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ee:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  1018f5:	00 
  1018f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018f9:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101900:	00 08 00 
  101903:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101906:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10190d:	00 
  10190e:	83 e2 e0             	and    $0xffffffe0,%edx
  101911:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101918:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10191b:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101922:	00 
  101923:	83 e2 1f             	and    $0x1f,%edx
  101926:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10192d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101930:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101937:	00 
  101938:	83 e2 f0             	and    $0xfffffff0,%edx
  10193b:	83 ca 0e             	or     $0xe,%edx
  10193e:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101945:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101948:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10194f:	00 
  101950:	83 e2 ef             	and    $0xffffffef,%edx
  101953:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10195a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10195d:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101964:	00 
  101965:	83 e2 9f             	and    $0xffffff9f,%edx
  101968:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10196f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101972:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101979:	00 
  10197a:	83 ca 80             	or     $0xffffff80,%edx
  10197d:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101984:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101987:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10198e:	c1 e8 10             	shr    $0x10,%eax
  101991:	89 c2                	mov    %eax,%edx
  101993:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101996:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  10199d:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i;
	for(i = 0; i < 256; ++i){
  10199e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1019a2:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1019a9:	0f 8e 5c fe ff ff    	jle    10180b <idt_init+0x12>
  1019af:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  1019b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019b9:	0f 01 18             	lidtl  (%eax)
	else{
	SETGATE(idt[i], 0, KERNEL_CS, __vectors[i], DPL_KERNEL);
}
}
	lidt(&idt_pd);
}
  1019bc:	c9                   	leave  
  1019bd:	c3                   	ret    

001019be <trapname>:

static const char *
trapname(int trapno) {
  1019be:	55                   	push   %ebp
  1019bf:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1019c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019c4:	83 f8 13             	cmp    $0x13,%eax
  1019c7:	77 0c                	ja     1019d5 <trapname+0x17>
        return excnames[trapno];
  1019c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019cc:	8b 04 85 a0 3b 10 00 	mov    0x103ba0(,%eax,4),%eax
  1019d3:	eb 18                	jmp    1019ed <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019d5:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019d9:	7e 0d                	jle    1019e8 <trapname+0x2a>
  1019db:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019df:	7f 07                	jg     1019e8 <trapname+0x2a>
        return "Hardware Interrupt";
  1019e1:	b8 4a 38 10 00       	mov    $0x10384a,%eax
  1019e6:	eb 05                	jmp    1019ed <trapname+0x2f>
    }
    return "(unknown trap)";
  1019e8:	b8 5d 38 10 00       	mov    $0x10385d,%eax
}
  1019ed:	5d                   	pop    %ebp
  1019ee:	c3                   	ret    

001019ef <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019ef:	55                   	push   %ebp
  1019f0:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f5:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019f9:	66 83 f8 08          	cmp    $0x8,%ax
  1019fd:	0f 94 c0             	sete   %al
  101a00:	0f b6 c0             	movzbl %al,%eax
}
  101a03:	5d                   	pop    %ebp
  101a04:	c3                   	ret    

00101a05 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101a05:	55                   	push   %ebp
  101a06:	89 e5                	mov    %esp,%ebp
  101a08:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101a0b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a0e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a12:	c7 04 24 9e 38 10 00 	movl   $0x10389e,(%esp)
  101a19:	e8 f4 e8 ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  101a1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a21:	89 04 24             	mov    %eax,(%esp)
  101a24:	e8 a1 01 00 00       	call   101bca <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a29:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2c:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a30:	0f b7 c0             	movzwl %ax,%eax
  101a33:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a37:	c7 04 24 af 38 10 00 	movl   $0x1038af,(%esp)
  101a3e:	e8 cf e8 ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a43:	8b 45 08             	mov    0x8(%ebp),%eax
  101a46:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a4a:	0f b7 c0             	movzwl %ax,%eax
  101a4d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a51:	c7 04 24 c2 38 10 00 	movl   $0x1038c2,(%esp)
  101a58:	e8 b5 e8 ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a5d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a60:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a64:	0f b7 c0             	movzwl %ax,%eax
  101a67:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a6b:	c7 04 24 d5 38 10 00 	movl   $0x1038d5,(%esp)
  101a72:	e8 9b e8 ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a77:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7a:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a7e:	0f b7 c0             	movzwl %ax,%eax
  101a81:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a85:	c7 04 24 e8 38 10 00 	movl   $0x1038e8,(%esp)
  101a8c:	e8 81 e8 ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a91:	8b 45 08             	mov    0x8(%ebp),%eax
  101a94:	8b 40 30             	mov    0x30(%eax),%eax
  101a97:	89 04 24             	mov    %eax,(%esp)
  101a9a:	e8 1f ff ff ff       	call   1019be <trapname>
  101a9f:	8b 55 08             	mov    0x8(%ebp),%edx
  101aa2:	8b 52 30             	mov    0x30(%edx),%edx
  101aa5:	89 44 24 08          	mov    %eax,0x8(%esp)
  101aa9:	89 54 24 04          	mov    %edx,0x4(%esp)
  101aad:	c7 04 24 fb 38 10 00 	movl   $0x1038fb,(%esp)
  101ab4:	e8 59 e8 ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101ab9:	8b 45 08             	mov    0x8(%ebp),%eax
  101abc:	8b 40 34             	mov    0x34(%eax),%eax
  101abf:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac3:	c7 04 24 0d 39 10 00 	movl   $0x10390d,(%esp)
  101aca:	e8 43 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101acf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad2:	8b 40 38             	mov    0x38(%eax),%eax
  101ad5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ad9:	c7 04 24 1c 39 10 00 	movl   $0x10391c,(%esp)
  101ae0:	e8 2d e8 ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101ae5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae8:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101aec:	0f b7 c0             	movzwl %ax,%eax
  101aef:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af3:	c7 04 24 2b 39 10 00 	movl   $0x10392b,(%esp)
  101afa:	e8 13 e8 ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101aff:	8b 45 08             	mov    0x8(%ebp),%eax
  101b02:	8b 40 40             	mov    0x40(%eax),%eax
  101b05:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b09:	c7 04 24 3e 39 10 00 	movl   $0x10393e,(%esp)
  101b10:	e8 fd e7 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b1c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b23:	eb 3e                	jmp    101b63 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b25:	8b 45 08             	mov    0x8(%ebp),%eax
  101b28:	8b 50 40             	mov    0x40(%eax),%edx
  101b2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b2e:	21 d0                	and    %edx,%eax
  101b30:	85 c0                	test   %eax,%eax
  101b32:	74 28                	je     101b5c <print_trapframe+0x157>
  101b34:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b37:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b3e:	85 c0                	test   %eax,%eax
  101b40:	74 1a                	je     101b5c <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101b42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b45:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b4c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b50:	c7 04 24 4d 39 10 00 	movl   $0x10394d,(%esp)
  101b57:	e8 b6 e7 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b5c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b60:	d1 65 f0             	shll   -0x10(%ebp)
  101b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b66:	83 f8 17             	cmp    $0x17,%eax
  101b69:	76 ba                	jbe    101b25 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b6b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6e:	8b 40 40             	mov    0x40(%eax),%eax
  101b71:	25 00 30 00 00       	and    $0x3000,%eax
  101b76:	c1 e8 0c             	shr    $0xc,%eax
  101b79:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b7d:	c7 04 24 51 39 10 00 	movl   $0x103951,(%esp)
  101b84:	e8 89 e7 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  101b89:	8b 45 08             	mov    0x8(%ebp),%eax
  101b8c:	89 04 24             	mov    %eax,(%esp)
  101b8f:	e8 5b fe ff ff       	call   1019ef <trap_in_kernel>
  101b94:	85 c0                	test   %eax,%eax
  101b96:	75 30                	jne    101bc8 <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b98:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9b:	8b 40 44             	mov    0x44(%eax),%eax
  101b9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba2:	c7 04 24 5a 39 10 00 	movl   $0x10395a,(%esp)
  101ba9:	e8 64 e7 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101bae:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb1:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101bb5:	0f b7 c0             	movzwl %ax,%eax
  101bb8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bbc:	c7 04 24 69 39 10 00 	movl   $0x103969,(%esp)
  101bc3:	e8 4a e7 ff ff       	call   100312 <cprintf>
    }
}
  101bc8:	c9                   	leave  
  101bc9:	c3                   	ret    

00101bca <print_regs>:

void
print_regs(struct pushregs *regs) {
  101bca:	55                   	push   %ebp
  101bcb:	89 e5                	mov    %esp,%ebp
  101bcd:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101bd0:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd3:	8b 00                	mov    (%eax),%eax
  101bd5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd9:	c7 04 24 7c 39 10 00 	movl   $0x10397c,(%esp)
  101be0:	e8 2d e7 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101be5:	8b 45 08             	mov    0x8(%ebp),%eax
  101be8:	8b 40 04             	mov    0x4(%eax),%eax
  101beb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bef:	c7 04 24 8b 39 10 00 	movl   $0x10398b,(%esp)
  101bf6:	e8 17 e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bfb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bfe:	8b 40 08             	mov    0x8(%eax),%eax
  101c01:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c05:	c7 04 24 9a 39 10 00 	movl   $0x10399a,(%esp)
  101c0c:	e8 01 e7 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c11:	8b 45 08             	mov    0x8(%ebp),%eax
  101c14:	8b 40 0c             	mov    0xc(%eax),%eax
  101c17:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c1b:	c7 04 24 a9 39 10 00 	movl   $0x1039a9,(%esp)
  101c22:	e8 eb e6 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c27:	8b 45 08             	mov    0x8(%ebp),%eax
  101c2a:	8b 40 10             	mov    0x10(%eax),%eax
  101c2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c31:	c7 04 24 b8 39 10 00 	movl   $0x1039b8,(%esp)
  101c38:	e8 d5 e6 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c40:	8b 40 14             	mov    0x14(%eax),%eax
  101c43:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c47:	c7 04 24 c7 39 10 00 	movl   $0x1039c7,(%esp)
  101c4e:	e8 bf e6 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c53:	8b 45 08             	mov    0x8(%ebp),%eax
  101c56:	8b 40 18             	mov    0x18(%eax),%eax
  101c59:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c5d:	c7 04 24 d6 39 10 00 	movl   $0x1039d6,(%esp)
  101c64:	e8 a9 e6 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c69:	8b 45 08             	mov    0x8(%ebp),%eax
  101c6c:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c6f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c73:	c7 04 24 e5 39 10 00 	movl   $0x1039e5,(%esp)
  101c7a:	e8 93 e6 ff ff       	call   100312 <cprintf>
}
  101c7f:	c9                   	leave  
  101c80:	c3                   	ret    

00101c81 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c81:	55                   	push   %ebp
  101c82:	89 e5                	mov    %esp,%ebp
  101c84:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101c87:	8b 45 08             	mov    0x8(%ebp),%eax
  101c8a:	8b 40 30             	mov    0x30(%eax),%eax
  101c8d:	83 f8 2f             	cmp    $0x2f,%eax
  101c90:	77 21                	ja     101cb3 <trap_dispatch+0x32>
  101c92:	83 f8 2e             	cmp    $0x2e,%eax
  101c95:	0f 83 0e 01 00 00    	jae    101da9 <trap_dispatch+0x128>
  101c9b:	83 f8 21             	cmp    $0x21,%eax
  101c9e:	0f 84 8b 00 00 00    	je     101d2f <trap_dispatch+0xae>
  101ca4:	83 f8 24             	cmp    $0x24,%eax
  101ca7:	74 60                	je     101d09 <trap_dispatch+0x88>
  101ca9:	83 f8 20             	cmp    $0x20,%eax
  101cac:	74 16                	je     101cc4 <trap_dispatch+0x43>
  101cae:	e9 be 00 00 00       	jmp    101d71 <trap_dispatch+0xf0>
  101cb3:	83 e8 78             	sub    $0x78,%eax
  101cb6:	83 f8 01             	cmp    $0x1,%eax
  101cb9:	0f 87 b2 00 00 00    	ja     101d71 <trap_dispatch+0xf0>
  101cbf:	e9 91 00 00 00       	jmp    101d55 <trap_dispatch+0xd4>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
	ticks++;
  101cc4:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101cc9:	83 c0 01             	add    $0x1,%eax
  101ccc:	a3 08 f9 10 00       	mov    %eax,0x10f908
	if(ticks % TICK_NUM == 0){
  101cd1:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101cd7:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101cdc:	89 c8                	mov    %ecx,%eax
  101cde:	f7 e2                	mul    %edx
  101ce0:	89 d0                	mov    %edx,%eax
  101ce2:	c1 e8 05             	shr    $0x5,%eax
  101ce5:	6b c0 64             	imul   $0x64,%eax,%eax
  101ce8:	29 c1                	sub    %eax,%ecx
  101cea:	89 c8                	mov    %ecx,%eax
  101cec:	85 c0                	test   %eax,%eax
  101cee:	75 14                	jne    101d04 <trap_dispatch+0x83>
		print_ticks();
  101cf0:	e8 e8 fa ff ff       	call   1017dd <print_ticks>
		ticks = 0;
  101cf5:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  101cfc:	00 00 00 
	}
        break;
  101cff:	e9 a6 00 00 00       	jmp    101daa <trap_dispatch+0x129>
  101d04:	e9 a1 00 00 00       	jmp    101daa <trap_dispatch+0x129>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d09:	e8 a6 f8 ff ff       	call   1015b4 <cons_getc>
  101d0e:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d11:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d15:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d19:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d1d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d21:	c7 04 24 f4 39 10 00 	movl   $0x1039f4,(%esp)
  101d28:	e8 e5 e5 ff ff       	call   100312 <cprintf>
        break;
  101d2d:	eb 7b                	jmp    101daa <trap_dispatch+0x129>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d2f:	e8 80 f8 ff ff       	call   1015b4 <cons_getc>
  101d34:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d37:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d3b:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d3f:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d43:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d47:	c7 04 24 06 3a 10 00 	movl   $0x103a06,(%esp)
  101d4e:	e8 bf e5 ff ff       	call   100312 <cprintf>
        break;
  101d53:	eb 55                	jmp    101daa <trap_dispatch+0x129>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101d55:	c7 44 24 08 15 3a 10 	movl   $0x103a15,0x8(%esp)
  101d5c:	00 
  101d5d:	c7 44 24 04 b2 00 00 	movl   $0xb2,0x4(%esp)
  101d64:	00 
  101d65:	c7 04 24 25 3a 10 00 	movl   $0x103a25,(%esp)
  101d6c:	e8 25 ef ff ff       	call   100c96 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101d71:	8b 45 08             	mov    0x8(%ebp),%eax
  101d74:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d78:	0f b7 c0             	movzwl %ax,%eax
  101d7b:	83 e0 03             	and    $0x3,%eax
  101d7e:	85 c0                	test   %eax,%eax
  101d80:	75 28                	jne    101daa <trap_dispatch+0x129>
            print_trapframe(tf);
  101d82:	8b 45 08             	mov    0x8(%ebp),%eax
  101d85:	89 04 24             	mov    %eax,(%esp)
  101d88:	e8 78 fc ff ff       	call   101a05 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101d8d:	c7 44 24 08 36 3a 10 	movl   $0x103a36,0x8(%esp)
  101d94:	00 
  101d95:	c7 44 24 04 bc 00 00 	movl   $0xbc,0x4(%esp)
  101d9c:	00 
  101d9d:	c7 04 24 25 3a 10 00 	movl   $0x103a25,(%esp)
  101da4:	e8 ed ee ff ff       	call   100c96 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101da9:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101daa:	c9                   	leave  
  101dab:	c3                   	ret    

00101dac <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101dac:	55                   	push   %ebp
  101dad:	89 e5                	mov    %esp,%ebp
  101daf:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101db2:	8b 45 08             	mov    0x8(%ebp),%eax
  101db5:	89 04 24             	mov    %eax,(%esp)
  101db8:	e8 c4 fe ff ff       	call   101c81 <trap_dispatch>
}
  101dbd:	c9                   	leave  
  101dbe:	c3                   	ret    

00101dbf <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101dbf:	1e                   	push   %ds
    pushl %es
  101dc0:	06                   	push   %es
    pushl %fs
  101dc1:	0f a0                	push   %fs
    pushl %gs
  101dc3:	0f a8                	push   %gs
    pushal
  101dc5:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101dc6:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101dcb:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101dcd:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101dcf:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101dd0:	e8 d7 ff ff ff       	call   101dac <trap>

    # pop the pushed stack pointer
    popl %esp
  101dd5:	5c                   	pop    %esp

00101dd6 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101dd6:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101dd7:	0f a9                	pop    %gs
    popl %fs
  101dd9:	0f a1                	pop    %fs
    popl %es
  101ddb:	07                   	pop    %es
    popl %ds
  101ddc:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101ddd:	83 c4 08             	add    $0x8,%esp
    iret
  101de0:	cf                   	iret   

00101de1 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101de1:	6a 00                	push   $0x0
  pushl $0
  101de3:	6a 00                	push   $0x0
  jmp __alltraps
  101de5:	e9 d5 ff ff ff       	jmp    101dbf <__alltraps>

00101dea <vector1>:
.globl vector1
vector1:
  pushl $0
  101dea:	6a 00                	push   $0x0
  pushl $1
  101dec:	6a 01                	push   $0x1
  jmp __alltraps
  101dee:	e9 cc ff ff ff       	jmp    101dbf <__alltraps>

00101df3 <vector2>:
.globl vector2
vector2:
  pushl $0
  101df3:	6a 00                	push   $0x0
  pushl $2
  101df5:	6a 02                	push   $0x2
  jmp __alltraps
  101df7:	e9 c3 ff ff ff       	jmp    101dbf <__alltraps>

00101dfc <vector3>:
.globl vector3
vector3:
  pushl $0
  101dfc:	6a 00                	push   $0x0
  pushl $3
  101dfe:	6a 03                	push   $0x3
  jmp __alltraps
  101e00:	e9 ba ff ff ff       	jmp    101dbf <__alltraps>

00101e05 <vector4>:
.globl vector4
vector4:
  pushl $0
  101e05:	6a 00                	push   $0x0
  pushl $4
  101e07:	6a 04                	push   $0x4
  jmp __alltraps
  101e09:	e9 b1 ff ff ff       	jmp    101dbf <__alltraps>

00101e0e <vector5>:
.globl vector5
vector5:
  pushl $0
  101e0e:	6a 00                	push   $0x0
  pushl $5
  101e10:	6a 05                	push   $0x5
  jmp __alltraps
  101e12:	e9 a8 ff ff ff       	jmp    101dbf <__alltraps>

00101e17 <vector6>:
.globl vector6
vector6:
  pushl $0
  101e17:	6a 00                	push   $0x0
  pushl $6
  101e19:	6a 06                	push   $0x6
  jmp __alltraps
  101e1b:	e9 9f ff ff ff       	jmp    101dbf <__alltraps>

00101e20 <vector7>:
.globl vector7
vector7:
  pushl $0
  101e20:	6a 00                	push   $0x0
  pushl $7
  101e22:	6a 07                	push   $0x7
  jmp __alltraps
  101e24:	e9 96 ff ff ff       	jmp    101dbf <__alltraps>

00101e29 <vector8>:
.globl vector8
vector8:
  pushl $8
  101e29:	6a 08                	push   $0x8
  jmp __alltraps
  101e2b:	e9 8f ff ff ff       	jmp    101dbf <__alltraps>

00101e30 <vector9>:
.globl vector9
vector9:
  pushl $9
  101e30:	6a 09                	push   $0x9
  jmp __alltraps
  101e32:	e9 88 ff ff ff       	jmp    101dbf <__alltraps>

00101e37 <vector10>:
.globl vector10
vector10:
  pushl $10
  101e37:	6a 0a                	push   $0xa
  jmp __alltraps
  101e39:	e9 81 ff ff ff       	jmp    101dbf <__alltraps>

00101e3e <vector11>:
.globl vector11
vector11:
  pushl $11
  101e3e:	6a 0b                	push   $0xb
  jmp __alltraps
  101e40:	e9 7a ff ff ff       	jmp    101dbf <__alltraps>

00101e45 <vector12>:
.globl vector12
vector12:
  pushl $12
  101e45:	6a 0c                	push   $0xc
  jmp __alltraps
  101e47:	e9 73 ff ff ff       	jmp    101dbf <__alltraps>

00101e4c <vector13>:
.globl vector13
vector13:
  pushl $13
  101e4c:	6a 0d                	push   $0xd
  jmp __alltraps
  101e4e:	e9 6c ff ff ff       	jmp    101dbf <__alltraps>

00101e53 <vector14>:
.globl vector14
vector14:
  pushl $14
  101e53:	6a 0e                	push   $0xe
  jmp __alltraps
  101e55:	e9 65 ff ff ff       	jmp    101dbf <__alltraps>

00101e5a <vector15>:
.globl vector15
vector15:
  pushl $0
  101e5a:	6a 00                	push   $0x0
  pushl $15
  101e5c:	6a 0f                	push   $0xf
  jmp __alltraps
  101e5e:	e9 5c ff ff ff       	jmp    101dbf <__alltraps>

00101e63 <vector16>:
.globl vector16
vector16:
  pushl $0
  101e63:	6a 00                	push   $0x0
  pushl $16
  101e65:	6a 10                	push   $0x10
  jmp __alltraps
  101e67:	e9 53 ff ff ff       	jmp    101dbf <__alltraps>

00101e6c <vector17>:
.globl vector17
vector17:
  pushl $17
  101e6c:	6a 11                	push   $0x11
  jmp __alltraps
  101e6e:	e9 4c ff ff ff       	jmp    101dbf <__alltraps>

00101e73 <vector18>:
.globl vector18
vector18:
  pushl $0
  101e73:	6a 00                	push   $0x0
  pushl $18
  101e75:	6a 12                	push   $0x12
  jmp __alltraps
  101e77:	e9 43 ff ff ff       	jmp    101dbf <__alltraps>

00101e7c <vector19>:
.globl vector19
vector19:
  pushl $0
  101e7c:	6a 00                	push   $0x0
  pushl $19
  101e7e:	6a 13                	push   $0x13
  jmp __alltraps
  101e80:	e9 3a ff ff ff       	jmp    101dbf <__alltraps>

00101e85 <vector20>:
.globl vector20
vector20:
  pushl $0
  101e85:	6a 00                	push   $0x0
  pushl $20
  101e87:	6a 14                	push   $0x14
  jmp __alltraps
  101e89:	e9 31 ff ff ff       	jmp    101dbf <__alltraps>

00101e8e <vector21>:
.globl vector21
vector21:
  pushl $0
  101e8e:	6a 00                	push   $0x0
  pushl $21
  101e90:	6a 15                	push   $0x15
  jmp __alltraps
  101e92:	e9 28 ff ff ff       	jmp    101dbf <__alltraps>

00101e97 <vector22>:
.globl vector22
vector22:
  pushl $0
  101e97:	6a 00                	push   $0x0
  pushl $22
  101e99:	6a 16                	push   $0x16
  jmp __alltraps
  101e9b:	e9 1f ff ff ff       	jmp    101dbf <__alltraps>

00101ea0 <vector23>:
.globl vector23
vector23:
  pushl $0
  101ea0:	6a 00                	push   $0x0
  pushl $23
  101ea2:	6a 17                	push   $0x17
  jmp __alltraps
  101ea4:	e9 16 ff ff ff       	jmp    101dbf <__alltraps>

00101ea9 <vector24>:
.globl vector24
vector24:
  pushl $0
  101ea9:	6a 00                	push   $0x0
  pushl $24
  101eab:	6a 18                	push   $0x18
  jmp __alltraps
  101ead:	e9 0d ff ff ff       	jmp    101dbf <__alltraps>

00101eb2 <vector25>:
.globl vector25
vector25:
  pushl $0
  101eb2:	6a 00                	push   $0x0
  pushl $25
  101eb4:	6a 19                	push   $0x19
  jmp __alltraps
  101eb6:	e9 04 ff ff ff       	jmp    101dbf <__alltraps>

00101ebb <vector26>:
.globl vector26
vector26:
  pushl $0
  101ebb:	6a 00                	push   $0x0
  pushl $26
  101ebd:	6a 1a                	push   $0x1a
  jmp __alltraps
  101ebf:	e9 fb fe ff ff       	jmp    101dbf <__alltraps>

00101ec4 <vector27>:
.globl vector27
vector27:
  pushl $0
  101ec4:	6a 00                	push   $0x0
  pushl $27
  101ec6:	6a 1b                	push   $0x1b
  jmp __alltraps
  101ec8:	e9 f2 fe ff ff       	jmp    101dbf <__alltraps>

00101ecd <vector28>:
.globl vector28
vector28:
  pushl $0
  101ecd:	6a 00                	push   $0x0
  pushl $28
  101ecf:	6a 1c                	push   $0x1c
  jmp __alltraps
  101ed1:	e9 e9 fe ff ff       	jmp    101dbf <__alltraps>

00101ed6 <vector29>:
.globl vector29
vector29:
  pushl $0
  101ed6:	6a 00                	push   $0x0
  pushl $29
  101ed8:	6a 1d                	push   $0x1d
  jmp __alltraps
  101eda:	e9 e0 fe ff ff       	jmp    101dbf <__alltraps>

00101edf <vector30>:
.globl vector30
vector30:
  pushl $0
  101edf:	6a 00                	push   $0x0
  pushl $30
  101ee1:	6a 1e                	push   $0x1e
  jmp __alltraps
  101ee3:	e9 d7 fe ff ff       	jmp    101dbf <__alltraps>

00101ee8 <vector31>:
.globl vector31
vector31:
  pushl $0
  101ee8:	6a 00                	push   $0x0
  pushl $31
  101eea:	6a 1f                	push   $0x1f
  jmp __alltraps
  101eec:	e9 ce fe ff ff       	jmp    101dbf <__alltraps>

00101ef1 <vector32>:
.globl vector32
vector32:
  pushl $0
  101ef1:	6a 00                	push   $0x0
  pushl $32
  101ef3:	6a 20                	push   $0x20
  jmp __alltraps
  101ef5:	e9 c5 fe ff ff       	jmp    101dbf <__alltraps>

00101efa <vector33>:
.globl vector33
vector33:
  pushl $0
  101efa:	6a 00                	push   $0x0
  pushl $33
  101efc:	6a 21                	push   $0x21
  jmp __alltraps
  101efe:	e9 bc fe ff ff       	jmp    101dbf <__alltraps>

00101f03 <vector34>:
.globl vector34
vector34:
  pushl $0
  101f03:	6a 00                	push   $0x0
  pushl $34
  101f05:	6a 22                	push   $0x22
  jmp __alltraps
  101f07:	e9 b3 fe ff ff       	jmp    101dbf <__alltraps>

00101f0c <vector35>:
.globl vector35
vector35:
  pushl $0
  101f0c:	6a 00                	push   $0x0
  pushl $35
  101f0e:	6a 23                	push   $0x23
  jmp __alltraps
  101f10:	e9 aa fe ff ff       	jmp    101dbf <__alltraps>

00101f15 <vector36>:
.globl vector36
vector36:
  pushl $0
  101f15:	6a 00                	push   $0x0
  pushl $36
  101f17:	6a 24                	push   $0x24
  jmp __alltraps
  101f19:	e9 a1 fe ff ff       	jmp    101dbf <__alltraps>

00101f1e <vector37>:
.globl vector37
vector37:
  pushl $0
  101f1e:	6a 00                	push   $0x0
  pushl $37
  101f20:	6a 25                	push   $0x25
  jmp __alltraps
  101f22:	e9 98 fe ff ff       	jmp    101dbf <__alltraps>

00101f27 <vector38>:
.globl vector38
vector38:
  pushl $0
  101f27:	6a 00                	push   $0x0
  pushl $38
  101f29:	6a 26                	push   $0x26
  jmp __alltraps
  101f2b:	e9 8f fe ff ff       	jmp    101dbf <__alltraps>

00101f30 <vector39>:
.globl vector39
vector39:
  pushl $0
  101f30:	6a 00                	push   $0x0
  pushl $39
  101f32:	6a 27                	push   $0x27
  jmp __alltraps
  101f34:	e9 86 fe ff ff       	jmp    101dbf <__alltraps>

00101f39 <vector40>:
.globl vector40
vector40:
  pushl $0
  101f39:	6a 00                	push   $0x0
  pushl $40
  101f3b:	6a 28                	push   $0x28
  jmp __alltraps
  101f3d:	e9 7d fe ff ff       	jmp    101dbf <__alltraps>

00101f42 <vector41>:
.globl vector41
vector41:
  pushl $0
  101f42:	6a 00                	push   $0x0
  pushl $41
  101f44:	6a 29                	push   $0x29
  jmp __alltraps
  101f46:	e9 74 fe ff ff       	jmp    101dbf <__alltraps>

00101f4b <vector42>:
.globl vector42
vector42:
  pushl $0
  101f4b:	6a 00                	push   $0x0
  pushl $42
  101f4d:	6a 2a                	push   $0x2a
  jmp __alltraps
  101f4f:	e9 6b fe ff ff       	jmp    101dbf <__alltraps>

00101f54 <vector43>:
.globl vector43
vector43:
  pushl $0
  101f54:	6a 00                	push   $0x0
  pushl $43
  101f56:	6a 2b                	push   $0x2b
  jmp __alltraps
  101f58:	e9 62 fe ff ff       	jmp    101dbf <__alltraps>

00101f5d <vector44>:
.globl vector44
vector44:
  pushl $0
  101f5d:	6a 00                	push   $0x0
  pushl $44
  101f5f:	6a 2c                	push   $0x2c
  jmp __alltraps
  101f61:	e9 59 fe ff ff       	jmp    101dbf <__alltraps>

00101f66 <vector45>:
.globl vector45
vector45:
  pushl $0
  101f66:	6a 00                	push   $0x0
  pushl $45
  101f68:	6a 2d                	push   $0x2d
  jmp __alltraps
  101f6a:	e9 50 fe ff ff       	jmp    101dbf <__alltraps>

00101f6f <vector46>:
.globl vector46
vector46:
  pushl $0
  101f6f:	6a 00                	push   $0x0
  pushl $46
  101f71:	6a 2e                	push   $0x2e
  jmp __alltraps
  101f73:	e9 47 fe ff ff       	jmp    101dbf <__alltraps>

00101f78 <vector47>:
.globl vector47
vector47:
  pushl $0
  101f78:	6a 00                	push   $0x0
  pushl $47
  101f7a:	6a 2f                	push   $0x2f
  jmp __alltraps
  101f7c:	e9 3e fe ff ff       	jmp    101dbf <__alltraps>

00101f81 <vector48>:
.globl vector48
vector48:
  pushl $0
  101f81:	6a 00                	push   $0x0
  pushl $48
  101f83:	6a 30                	push   $0x30
  jmp __alltraps
  101f85:	e9 35 fe ff ff       	jmp    101dbf <__alltraps>

00101f8a <vector49>:
.globl vector49
vector49:
  pushl $0
  101f8a:	6a 00                	push   $0x0
  pushl $49
  101f8c:	6a 31                	push   $0x31
  jmp __alltraps
  101f8e:	e9 2c fe ff ff       	jmp    101dbf <__alltraps>

00101f93 <vector50>:
.globl vector50
vector50:
  pushl $0
  101f93:	6a 00                	push   $0x0
  pushl $50
  101f95:	6a 32                	push   $0x32
  jmp __alltraps
  101f97:	e9 23 fe ff ff       	jmp    101dbf <__alltraps>

00101f9c <vector51>:
.globl vector51
vector51:
  pushl $0
  101f9c:	6a 00                	push   $0x0
  pushl $51
  101f9e:	6a 33                	push   $0x33
  jmp __alltraps
  101fa0:	e9 1a fe ff ff       	jmp    101dbf <__alltraps>

00101fa5 <vector52>:
.globl vector52
vector52:
  pushl $0
  101fa5:	6a 00                	push   $0x0
  pushl $52
  101fa7:	6a 34                	push   $0x34
  jmp __alltraps
  101fa9:	e9 11 fe ff ff       	jmp    101dbf <__alltraps>

00101fae <vector53>:
.globl vector53
vector53:
  pushl $0
  101fae:	6a 00                	push   $0x0
  pushl $53
  101fb0:	6a 35                	push   $0x35
  jmp __alltraps
  101fb2:	e9 08 fe ff ff       	jmp    101dbf <__alltraps>

00101fb7 <vector54>:
.globl vector54
vector54:
  pushl $0
  101fb7:	6a 00                	push   $0x0
  pushl $54
  101fb9:	6a 36                	push   $0x36
  jmp __alltraps
  101fbb:	e9 ff fd ff ff       	jmp    101dbf <__alltraps>

00101fc0 <vector55>:
.globl vector55
vector55:
  pushl $0
  101fc0:	6a 00                	push   $0x0
  pushl $55
  101fc2:	6a 37                	push   $0x37
  jmp __alltraps
  101fc4:	e9 f6 fd ff ff       	jmp    101dbf <__alltraps>

00101fc9 <vector56>:
.globl vector56
vector56:
  pushl $0
  101fc9:	6a 00                	push   $0x0
  pushl $56
  101fcb:	6a 38                	push   $0x38
  jmp __alltraps
  101fcd:	e9 ed fd ff ff       	jmp    101dbf <__alltraps>

00101fd2 <vector57>:
.globl vector57
vector57:
  pushl $0
  101fd2:	6a 00                	push   $0x0
  pushl $57
  101fd4:	6a 39                	push   $0x39
  jmp __alltraps
  101fd6:	e9 e4 fd ff ff       	jmp    101dbf <__alltraps>

00101fdb <vector58>:
.globl vector58
vector58:
  pushl $0
  101fdb:	6a 00                	push   $0x0
  pushl $58
  101fdd:	6a 3a                	push   $0x3a
  jmp __alltraps
  101fdf:	e9 db fd ff ff       	jmp    101dbf <__alltraps>

00101fe4 <vector59>:
.globl vector59
vector59:
  pushl $0
  101fe4:	6a 00                	push   $0x0
  pushl $59
  101fe6:	6a 3b                	push   $0x3b
  jmp __alltraps
  101fe8:	e9 d2 fd ff ff       	jmp    101dbf <__alltraps>

00101fed <vector60>:
.globl vector60
vector60:
  pushl $0
  101fed:	6a 00                	push   $0x0
  pushl $60
  101fef:	6a 3c                	push   $0x3c
  jmp __alltraps
  101ff1:	e9 c9 fd ff ff       	jmp    101dbf <__alltraps>

00101ff6 <vector61>:
.globl vector61
vector61:
  pushl $0
  101ff6:	6a 00                	push   $0x0
  pushl $61
  101ff8:	6a 3d                	push   $0x3d
  jmp __alltraps
  101ffa:	e9 c0 fd ff ff       	jmp    101dbf <__alltraps>

00101fff <vector62>:
.globl vector62
vector62:
  pushl $0
  101fff:	6a 00                	push   $0x0
  pushl $62
  102001:	6a 3e                	push   $0x3e
  jmp __alltraps
  102003:	e9 b7 fd ff ff       	jmp    101dbf <__alltraps>

00102008 <vector63>:
.globl vector63
vector63:
  pushl $0
  102008:	6a 00                	push   $0x0
  pushl $63
  10200a:	6a 3f                	push   $0x3f
  jmp __alltraps
  10200c:	e9 ae fd ff ff       	jmp    101dbf <__alltraps>

00102011 <vector64>:
.globl vector64
vector64:
  pushl $0
  102011:	6a 00                	push   $0x0
  pushl $64
  102013:	6a 40                	push   $0x40
  jmp __alltraps
  102015:	e9 a5 fd ff ff       	jmp    101dbf <__alltraps>

0010201a <vector65>:
.globl vector65
vector65:
  pushl $0
  10201a:	6a 00                	push   $0x0
  pushl $65
  10201c:	6a 41                	push   $0x41
  jmp __alltraps
  10201e:	e9 9c fd ff ff       	jmp    101dbf <__alltraps>

00102023 <vector66>:
.globl vector66
vector66:
  pushl $0
  102023:	6a 00                	push   $0x0
  pushl $66
  102025:	6a 42                	push   $0x42
  jmp __alltraps
  102027:	e9 93 fd ff ff       	jmp    101dbf <__alltraps>

0010202c <vector67>:
.globl vector67
vector67:
  pushl $0
  10202c:	6a 00                	push   $0x0
  pushl $67
  10202e:	6a 43                	push   $0x43
  jmp __alltraps
  102030:	e9 8a fd ff ff       	jmp    101dbf <__alltraps>

00102035 <vector68>:
.globl vector68
vector68:
  pushl $0
  102035:	6a 00                	push   $0x0
  pushl $68
  102037:	6a 44                	push   $0x44
  jmp __alltraps
  102039:	e9 81 fd ff ff       	jmp    101dbf <__alltraps>

0010203e <vector69>:
.globl vector69
vector69:
  pushl $0
  10203e:	6a 00                	push   $0x0
  pushl $69
  102040:	6a 45                	push   $0x45
  jmp __alltraps
  102042:	e9 78 fd ff ff       	jmp    101dbf <__alltraps>

00102047 <vector70>:
.globl vector70
vector70:
  pushl $0
  102047:	6a 00                	push   $0x0
  pushl $70
  102049:	6a 46                	push   $0x46
  jmp __alltraps
  10204b:	e9 6f fd ff ff       	jmp    101dbf <__alltraps>

00102050 <vector71>:
.globl vector71
vector71:
  pushl $0
  102050:	6a 00                	push   $0x0
  pushl $71
  102052:	6a 47                	push   $0x47
  jmp __alltraps
  102054:	e9 66 fd ff ff       	jmp    101dbf <__alltraps>

00102059 <vector72>:
.globl vector72
vector72:
  pushl $0
  102059:	6a 00                	push   $0x0
  pushl $72
  10205b:	6a 48                	push   $0x48
  jmp __alltraps
  10205d:	e9 5d fd ff ff       	jmp    101dbf <__alltraps>

00102062 <vector73>:
.globl vector73
vector73:
  pushl $0
  102062:	6a 00                	push   $0x0
  pushl $73
  102064:	6a 49                	push   $0x49
  jmp __alltraps
  102066:	e9 54 fd ff ff       	jmp    101dbf <__alltraps>

0010206b <vector74>:
.globl vector74
vector74:
  pushl $0
  10206b:	6a 00                	push   $0x0
  pushl $74
  10206d:	6a 4a                	push   $0x4a
  jmp __alltraps
  10206f:	e9 4b fd ff ff       	jmp    101dbf <__alltraps>

00102074 <vector75>:
.globl vector75
vector75:
  pushl $0
  102074:	6a 00                	push   $0x0
  pushl $75
  102076:	6a 4b                	push   $0x4b
  jmp __alltraps
  102078:	e9 42 fd ff ff       	jmp    101dbf <__alltraps>

0010207d <vector76>:
.globl vector76
vector76:
  pushl $0
  10207d:	6a 00                	push   $0x0
  pushl $76
  10207f:	6a 4c                	push   $0x4c
  jmp __alltraps
  102081:	e9 39 fd ff ff       	jmp    101dbf <__alltraps>

00102086 <vector77>:
.globl vector77
vector77:
  pushl $0
  102086:	6a 00                	push   $0x0
  pushl $77
  102088:	6a 4d                	push   $0x4d
  jmp __alltraps
  10208a:	e9 30 fd ff ff       	jmp    101dbf <__alltraps>

0010208f <vector78>:
.globl vector78
vector78:
  pushl $0
  10208f:	6a 00                	push   $0x0
  pushl $78
  102091:	6a 4e                	push   $0x4e
  jmp __alltraps
  102093:	e9 27 fd ff ff       	jmp    101dbf <__alltraps>

00102098 <vector79>:
.globl vector79
vector79:
  pushl $0
  102098:	6a 00                	push   $0x0
  pushl $79
  10209a:	6a 4f                	push   $0x4f
  jmp __alltraps
  10209c:	e9 1e fd ff ff       	jmp    101dbf <__alltraps>

001020a1 <vector80>:
.globl vector80
vector80:
  pushl $0
  1020a1:	6a 00                	push   $0x0
  pushl $80
  1020a3:	6a 50                	push   $0x50
  jmp __alltraps
  1020a5:	e9 15 fd ff ff       	jmp    101dbf <__alltraps>

001020aa <vector81>:
.globl vector81
vector81:
  pushl $0
  1020aa:	6a 00                	push   $0x0
  pushl $81
  1020ac:	6a 51                	push   $0x51
  jmp __alltraps
  1020ae:	e9 0c fd ff ff       	jmp    101dbf <__alltraps>

001020b3 <vector82>:
.globl vector82
vector82:
  pushl $0
  1020b3:	6a 00                	push   $0x0
  pushl $82
  1020b5:	6a 52                	push   $0x52
  jmp __alltraps
  1020b7:	e9 03 fd ff ff       	jmp    101dbf <__alltraps>

001020bc <vector83>:
.globl vector83
vector83:
  pushl $0
  1020bc:	6a 00                	push   $0x0
  pushl $83
  1020be:	6a 53                	push   $0x53
  jmp __alltraps
  1020c0:	e9 fa fc ff ff       	jmp    101dbf <__alltraps>

001020c5 <vector84>:
.globl vector84
vector84:
  pushl $0
  1020c5:	6a 00                	push   $0x0
  pushl $84
  1020c7:	6a 54                	push   $0x54
  jmp __alltraps
  1020c9:	e9 f1 fc ff ff       	jmp    101dbf <__alltraps>

001020ce <vector85>:
.globl vector85
vector85:
  pushl $0
  1020ce:	6a 00                	push   $0x0
  pushl $85
  1020d0:	6a 55                	push   $0x55
  jmp __alltraps
  1020d2:	e9 e8 fc ff ff       	jmp    101dbf <__alltraps>

001020d7 <vector86>:
.globl vector86
vector86:
  pushl $0
  1020d7:	6a 00                	push   $0x0
  pushl $86
  1020d9:	6a 56                	push   $0x56
  jmp __alltraps
  1020db:	e9 df fc ff ff       	jmp    101dbf <__alltraps>

001020e0 <vector87>:
.globl vector87
vector87:
  pushl $0
  1020e0:	6a 00                	push   $0x0
  pushl $87
  1020e2:	6a 57                	push   $0x57
  jmp __alltraps
  1020e4:	e9 d6 fc ff ff       	jmp    101dbf <__alltraps>

001020e9 <vector88>:
.globl vector88
vector88:
  pushl $0
  1020e9:	6a 00                	push   $0x0
  pushl $88
  1020eb:	6a 58                	push   $0x58
  jmp __alltraps
  1020ed:	e9 cd fc ff ff       	jmp    101dbf <__alltraps>

001020f2 <vector89>:
.globl vector89
vector89:
  pushl $0
  1020f2:	6a 00                	push   $0x0
  pushl $89
  1020f4:	6a 59                	push   $0x59
  jmp __alltraps
  1020f6:	e9 c4 fc ff ff       	jmp    101dbf <__alltraps>

001020fb <vector90>:
.globl vector90
vector90:
  pushl $0
  1020fb:	6a 00                	push   $0x0
  pushl $90
  1020fd:	6a 5a                	push   $0x5a
  jmp __alltraps
  1020ff:	e9 bb fc ff ff       	jmp    101dbf <__alltraps>

00102104 <vector91>:
.globl vector91
vector91:
  pushl $0
  102104:	6a 00                	push   $0x0
  pushl $91
  102106:	6a 5b                	push   $0x5b
  jmp __alltraps
  102108:	e9 b2 fc ff ff       	jmp    101dbf <__alltraps>

0010210d <vector92>:
.globl vector92
vector92:
  pushl $0
  10210d:	6a 00                	push   $0x0
  pushl $92
  10210f:	6a 5c                	push   $0x5c
  jmp __alltraps
  102111:	e9 a9 fc ff ff       	jmp    101dbf <__alltraps>

00102116 <vector93>:
.globl vector93
vector93:
  pushl $0
  102116:	6a 00                	push   $0x0
  pushl $93
  102118:	6a 5d                	push   $0x5d
  jmp __alltraps
  10211a:	e9 a0 fc ff ff       	jmp    101dbf <__alltraps>

0010211f <vector94>:
.globl vector94
vector94:
  pushl $0
  10211f:	6a 00                	push   $0x0
  pushl $94
  102121:	6a 5e                	push   $0x5e
  jmp __alltraps
  102123:	e9 97 fc ff ff       	jmp    101dbf <__alltraps>

00102128 <vector95>:
.globl vector95
vector95:
  pushl $0
  102128:	6a 00                	push   $0x0
  pushl $95
  10212a:	6a 5f                	push   $0x5f
  jmp __alltraps
  10212c:	e9 8e fc ff ff       	jmp    101dbf <__alltraps>

00102131 <vector96>:
.globl vector96
vector96:
  pushl $0
  102131:	6a 00                	push   $0x0
  pushl $96
  102133:	6a 60                	push   $0x60
  jmp __alltraps
  102135:	e9 85 fc ff ff       	jmp    101dbf <__alltraps>

0010213a <vector97>:
.globl vector97
vector97:
  pushl $0
  10213a:	6a 00                	push   $0x0
  pushl $97
  10213c:	6a 61                	push   $0x61
  jmp __alltraps
  10213e:	e9 7c fc ff ff       	jmp    101dbf <__alltraps>

00102143 <vector98>:
.globl vector98
vector98:
  pushl $0
  102143:	6a 00                	push   $0x0
  pushl $98
  102145:	6a 62                	push   $0x62
  jmp __alltraps
  102147:	e9 73 fc ff ff       	jmp    101dbf <__alltraps>

0010214c <vector99>:
.globl vector99
vector99:
  pushl $0
  10214c:	6a 00                	push   $0x0
  pushl $99
  10214e:	6a 63                	push   $0x63
  jmp __alltraps
  102150:	e9 6a fc ff ff       	jmp    101dbf <__alltraps>

00102155 <vector100>:
.globl vector100
vector100:
  pushl $0
  102155:	6a 00                	push   $0x0
  pushl $100
  102157:	6a 64                	push   $0x64
  jmp __alltraps
  102159:	e9 61 fc ff ff       	jmp    101dbf <__alltraps>

0010215e <vector101>:
.globl vector101
vector101:
  pushl $0
  10215e:	6a 00                	push   $0x0
  pushl $101
  102160:	6a 65                	push   $0x65
  jmp __alltraps
  102162:	e9 58 fc ff ff       	jmp    101dbf <__alltraps>

00102167 <vector102>:
.globl vector102
vector102:
  pushl $0
  102167:	6a 00                	push   $0x0
  pushl $102
  102169:	6a 66                	push   $0x66
  jmp __alltraps
  10216b:	e9 4f fc ff ff       	jmp    101dbf <__alltraps>

00102170 <vector103>:
.globl vector103
vector103:
  pushl $0
  102170:	6a 00                	push   $0x0
  pushl $103
  102172:	6a 67                	push   $0x67
  jmp __alltraps
  102174:	e9 46 fc ff ff       	jmp    101dbf <__alltraps>

00102179 <vector104>:
.globl vector104
vector104:
  pushl $0
  102179:	6a 00                	push   $0x0
  pushl $104
  10217b:	6a 68                	push   $0x68
  jmp __alltraps
  10217d:	e9 3d fc ff ff       	jmp    101dbf <__alltraps>

00102182 <vector105>:
.globl vector105
vector105:
  pushl $0
  102182:	6a 00                	push   $0x0
  pushl $105
  102184:	6a 69                	push   $0x69
  jmp __alltraps
  102186:	e9 34 fc ff ff       	jmp    101dbf <__alltraps>

0010218b <vector106>:
.globl vector106
vector106:
  pushl $0
  10218b:	6a 00                	push   $0x0
  pushl $106
  10218d:	6a 6a                	push   $0x6a
  jmp __alltraps
  10218f:	e9 2b fc ff ff       	jmp    101dbf <__alltraps>

00102194 <vector107>:
.globl vector107
vector107:
  pushl $0
  102194:	6a 00                	push   $0x0
  pushl $107
  102196:	6a 6b                	push   $0x6b
  jmp __alltraps
  102198:	e9 22 fc ff ff       	jmp    101dbf <__alltraps>

0010219d <vector108>:
.globl vector108
vector108:
  pushl $0
  10219d:	6a 00                	push   $0x0
  pushl $108
  10219f:	6a 6c                	push   $0x6c
  jmp __alltraps
  1021a1:	e9 19 fc ff ff       	jmp    101dbf <__alltraps>

001021a6 <vector109>:
.globl vector109
vector109:
  pushl $0
  1021a6:	6a 00                	push   $0x0
  pushl $109
  1021a8:	6a 6d                	push   $0x6d
  jmp __alltraps
  1021aa:	e9 10 fc ff ff       	jmp    101dbf <__alltraps>

001021af <vector110>:
.globl vector110
vector110:
  pushl $0
  1021af:	6a 00                	push   $0x0
  pushl $110
  1021b1:	6a 6e                	push   $0x6e
  jmp __alltraps
  1021b3:	e9 07 fc ff ff       	jmp    101dbf <__alltraps>

001021b8 <vector111>:
.globl vector111
vector111:
  pushl $0
  1021b8:	6a 00                	push   $0x0
  pushl $111
  1021ba:	6a 6f                	push   $0x6f
  jmp __alltraps
  1021bc:	e9 fe fb ff ff       	jmp    101dbf <__alltraps>

001021c1 <vector112>:
.globl vector112
vector112:
  pushl $0
  1021c1:	6a 00                	push   $0x0
  pushl $112
  1021c3:	6a 70                	push   $0x70
  jmp __alltraps
  1021c5:	e9 f5 fb ff ff       	jmp    101dbf <__alltraps>

001021ca <vector113>:
.globl vector113
vector113:
  pushl $0
  1021ca:	6a 00                	push   $0x0
  pushl $113
  1021cc:	6a 71                	push   $0x71
  jmp __alltraps
  1021ce:	e9 ec fb ff ff       	jmp    101dbf <__alltraps>

001021d3 <vector114>:
.globl vector114
vector114:
  pushl $0
  1021d3:	6a 00                	push   $0x0
  pushl $114
  1021d5:	6a 72                	push   $0x72
  jmp __alltraps
  1021d7:	e9 e3 fb ff ff       	jmp    101dbf <__alltraps>

001021dc <vector115>:
.globl vector115
vector115:
  pushl $0
  1021dc:	6a 00                	push   $0x0
  pushl $115
  1021de:	6a 73                	push   $0x73
  jmp __alltraps
  1021e0:	e9 da fb ff ff       	jmp    101dbf <__alltraps>

001021e5 <vector116>:
.globl vector116
vector116:
  pushl $0
  1021e5:	6a 00                	push   $0x0
  pushl $116
  1021e7:	6a 74                	push   $0x74
  jmp __alltraps
  1021e9:	e9 d1 fb ff ff       	jmp    101dbf <__alltraps>

001021ee <vector117>:
.globl vector117
vector117:
  pushl $0
  1021ee:	6a 00                	push   $0x0
  pushl $117
  1021f0:	6a 75                	push   $0x75
  jmp __alltraps
  1021f2:	e9 c8 fb ff ff       	jmp    101dbf <__alltraps>

001021f7 <vector118>:
.globl vector118
vector118:
  pushl $0
  1021f7:	6a 00                	push   $0x0
  pushl $118
  1021f9:	6a 76                	push   $0x76
  jmp __alltraps
  1021fb:	e9 bf fb ff ff       	jmp    101dbf <__alltraps>

00102200 <vector119>:
.globl vector119
vector119:
  pushl $0
  102200:	6a 00                	push   $0x0
  pushl $119
  102202:	6a 77                	push   $0x77
  jmp __alltraps
  102204:	e9 b6 fb ff ff       	jmp    101dbf <__alltraps>

00102209 <vector120>:
.globl vector120
vector120:
  pushl $0
  102209:	6a 00                	push   $0x0
  pushl $120
  10220b:	6a 78                	push   $0x78
  jmp __alltraps
  10220d:	e9 ad fb ff ff       	jmp    101dbf <__alltraps>

00102212 <vector121>:
.globl vector121
vector121:
  pushl $0
  102212:	6a 00                	push   $0x0
  pushl $121
  102214:	6a 79                	push   $0x79
  jmp __alltraps
  102216:	e9 a4 fb ff ff       	jmp    101dbf <__alltraps>

0010221b <vector122>:
.globl vector122
vector122:
  pushl $0
  10221b:	6a 00                	push   $0x0
  pushl $122
  10221d:	6a 7a                	push   $0x7a
  jmp __alltraps
  10221f:	e9 9b fb ff ff       	jmp    101dbf <__alltraps>

00102224 <vector123>:
.globl vector123
vector123:
  pushl $0
  102224:	6a 00                	push   $0x0
  pushl $123
  102226:	6a 7b                	push   $0x7b
  jmp __alltraps
  102228:	e9 92 fb ff ff       	jmp    101dbf <__alltraps>

0010222d <vector124>:
.globl vector124
vector124:
  pushl $0
  10222d:	6a 00                	push   $0x0
  pushl $124
  10222f:	6a 7c                	push   $0x7c
  jmp __alltraps
  102231:	e9 89 fb ff ff       	jmp    101dbf <__alltraps>

00102236 <vector125>:
.globl vector125
vector125:
  pushl $0
  102236:	6a 00                	push   $0x0
  pushl $125
  102238:	6a 7d                	push   $0x7d
  jmp __alltraps
  10223a:	e9 80 fb ff ff       	jmp    101dbf <__alltraps>

0010223f <vector126>:
.globl vector126
vector126:
  pushl $0
  10223f:	6a 00                	push   $0x0
  pushl $126
  102241:	6a 7e                	push   $0x7e
  jmp __alltraps
  102243:	e9 77 fb ff ff       	jmp    101dbf <__alltraps>

00102248 <vector127>:
.globl vector127
vector127:
  pushl $0
  102248:	6a 00                	push   $0x0
  pushl $127
  10224a:	6a 7f                	push   $0x7f
  jmp __alltraps
  10224c:	e9 6e fb ff ff       	jmp    101dbf <__alltraps>

00102251 <vector128>:
.globl vector128
vector128:
  pushl $0
  102251:	6a 00                	push   $0x0
  pushl $128
  102253:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102258:	e9 62 fb ff ff       	jmp    101dbf <__alltraps>

0010225d <vector129>:
.globl vector129
vector129:
  pushl $0
  10225d:	6a 00                	push   $0x0
  pushl $129
  10225f:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102264:	e9 56 fb ff ff       	jmp    101dbf <__alltraps>

00102269 <vector130>:
.globl vector130
vector130:
  pushl $0
  102269:	6a 00                	push   $0x0
  pushl $130
  10226b:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102270:	e9 4a fb ff ff       	jmp    101dbf <__alltraps>

00102275 <vector131>:
.globl vector131
vector131:
  pushl $0
  102275:	6a 00                	push   $0x0
  pushl $131
  102277:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10227c:	e9 3e fb ff ff       	jmp    101dbf <__alltraps>

00102281 <vector132>:
.globl vector132
vector132:
  pushl $0
  102281:	6a 00                	push   $0x0
  pushl $132
  102283:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102288:	e9 32 fb ff ff       	jmp    101dbf <__alltraps>

0010228d <vector133>:
.globl vector133
vector133:
  pushl $0
  10228d:	6a 00                	push   $0x0
  pushl $133
  10228f:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102294:	e9 26 fb ff ff       	jmp    101dbf <__alltraps>

00102299 <vector134>:
.globl vector134
vector134:
  pushl $0
  102299:	6a 00                	push   $0x0
  pushl $134
  10229b:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1022a0:	e9 1a fb ff ff       	jmp    101dbf <__alltraps>

001022a5 <vector135>:
.globl vector135
vector135:
  pushl $0
  1022a5:	6a 00                	push   $0x0
  pushl $135
  1022a7:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1022ac:	e9 0e fb ff ff       	jmp    101dbf <__alltraps>

001022b1 <vector136>:
.globl vector136
vector136:
  pushl $0
  1022b1:	6a 00                	push   $0x0
  pushl $136
  1022b3:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1022b8:	e9 02 fb ff ff       	jmp    101dbf <__alltraps>

001022bd <vector137>:
.globl vector137
vector137:
  pushl $0
  1022bd:	6a 00                	push   $0x0
  pushl $137
  1022bf:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1022c4:	e9 f6 fa ff ff       	jmp    101dbf <__alltraps>

001022c9 <vector138>:
.globl vector138
vector138:
  pushl $0
  1022c9:	6a 00                	push   $0x0
  pushl $138
  1022cb:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1022d0:	e9 ea fa ff ff       	jmp    101dbf <__alltraps>

001022d5 <vector139>:
.globl vector139
vector139:
  pushl $0
  1022d5:	6a 00                	push   $0x0
  pushl $139
  1022d7:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1022dc:	e9 de fa ff ff       	jmp    101dbf <__alltraps>

001022e1 <vector140>:
.globl vector140
vector140:
  pushl $0
  1022e1:	6a 00                	push   $0x0
  pushl $140
  1022e3:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1022e8:	e9 d2 fa ff ff       	jmp    101dbf <__alltraps>

001022ed <vector141>:
.globl vector141
vector141:
  pushl $0
  1022ed:	6a 00                	push   $0x0
  pushl $141
  1022ef:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1022f4:	e9 c6 fa ff ff       	jmp    101dbf <__alltraps>

001022f9 <vector142>:
.globl vector142
vector142:
  pushl $0
  1022f9:	6a 00                	push   $0x0
  pushl $142
  1022fb:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102300:	e9 ba fa ff ff       	jmp    101dbf <__alltraps>

00102305 <vector143>:
.globl vector143
vector143:
  pushl $0
  102305:	6a 00                	push   $0x0
  pushl $143
  102307:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  10230c:	e9 ae fa ff ff       	jmp    101dbf <__alltraps>

00102311 <vector144>:
.globl vector144
vector144:
  pushl $0
  102311:	6a 00                	push   $0x0
  pushl $144
  102313:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102318:	e9 a2 fa ff ff       	jmp    101dbf <__alltraps>

0010231d <vector145>:
.globl vector145
vector145:
  pushl $0
  10231d:	6a 00                	push   $0x0
  pushl $145
  10231f:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102324:	e9 96 fa ff ff       	jmp    101dbf <__alltraps>

00102329 <vector146>:
.globl vector146
vector146:
  pushl $0
  102329:	6a 00                	push   $0x0
  pushl $146
  10232b:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102330:	e9 8a fa ff ff       	jmp    101dbf <__alltraps>

00102335 <vector147>:
.globl vector147
vector147:
  pushl $0
  102335:	6a 00                	push   $0x0
  pushl $147
  102337:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10233c:	e9 7e fa ff ff       	jmp    101dbf <__alltraps>

00102341 <vector148>:
.globl vector148
vector148:
  pushl $0
  102341:	6a 00                	push   $0x0
  pushl $148
  102343:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102348:	e9 72 fa ff ff       	jmp    101dbf <__alltraps>

0010234d <vector149>:
.globl vector149
vector149:
  pushl $0
  10234d:	6a 00                	push   $0x0
  pushl $149
  10234f:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102354:	e9 66 fa ff ff       	jmp    101dbf <__alltraps>

00102359 <vector150>:
.globl vector150
vector150:
  pushl $0
  102359:	6a 00                	push   $0x0
  pushl $150
  10235b:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102360:	e9 5a fa ff ff       	jmp    101dbf <__alltraps>

00102365 <vector151>:
.globl vector151
vector151:
  pushl $0
  102365:	6a 00                	push   $0x0
  pushl $151
  102367:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10236c:	e9 4e fa ff ff       	jmp    101dbf <__alltraps>

00102371 <vector152>:
.globl vector152
vector152:
  pushl $0
  102371:	6a 00                	push   $0x0
  pushl $152
  102373:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102378:	e9 42 fa ff ff       	jmp    101dbf <__alltraps>

0010237d <vector153>:
.globl vector153
vector153:
  pushl $0
  10237d:	6a 00                	push   $0x0
  pushl $153
  10237f:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102384:	e9 36 fa ff ff       	jmp    101dbf <__alltraps>

00102389 <vector154>:
.globl vector154
vector154:
  pushl $0
  102389:	6a 00                	push   $0x0
  pushl $154
  10238b:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102390:	e9 2a fa ff ff       	jmp    101dbf <__alltraps>

00102395 <vector155>:
.globl vector155
vector155:
  pushl $0
  102395:	6a 00                	push   $0x0
  pushl $155
  102397:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10239c:	e9 1e fa ff ff       	jmp    101dbf <__alltraps>

001023a1 <vector156>:
.globl vector156
vector156:
  pushl $0
  1023a1:	6a 00                	push   $0x0
  pushl $156
  1023a3:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1023a8:	e9 12 fa ff ff       	jmp    101dbf <__alltraps>

001023ad <vector157>:
.globl vector157
vector157:
  pushl $0
  1023ad:	6a 00                	push   $0x0
  pushl $157
  1023af:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1023b4:	e9 06 fa ff ff       	jmp    101dbf <__alltraps>

001023b9 <vector158>:
.globl vector158
vector158:
  pushl $0
  1023b9:	6a 00                	push   $0x0
  pushl $158
  1023bb:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1023c0:	e9 fa f9 ff ff       	jmp    101dbf <__alltraps>

001023c5 <vector159>:
.globl vector159
vector159:
  pushl $0
  1023c5:	6a 00                	push   $0x0
  pushl $159
  1023c7:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1023cc:	e9 ee f9 ff ff       	jmp    101dbf <__alltraps>

001023d1 <vector160>:
.globl vector160
vector160:
  pushl $0
  1023d1:	6a 00                	push   $0x0
  pushl $160
  1023d3:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1023d8:	e9 e2 f9 ff ff       	jmp    101dbf <__alltraps>

001023dd <vector161>:
.globl vector161
vector161:
  pushl $0
  1023dd:	6a 00                	push   $0x0
  pushl $161
  1023df:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1023e4:	e9 d6 f9 ff ff       	jmp    101dbf <__alltraps>

001023e9 <vector162>:
.globl vector162
vector162:
  pushl $0
  1023e9:	6a 00                	push   $0x0
  pushl $162
  1023eb:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1023f0:	e9 ca f9 ff ff       	jmp    101dbf <__alltraps>

001023f5 <vector163>:
.globl vector163
vector163:
  pushl $0
  1023f5:	6a 00                	push   $0x0
  pushl $163
  1023f7:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1023fc:	e9 be f9 ff ff       	jmp    101dbf <__alltraps>

00102401 <vector164>:
.globl vector164
vector164:
  pushl $0
  102401:	6a 00                	push   $0x0
  pushl $164
  102403:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102408:	e9 b2 f9 ff ff       	jmp    101dbf <__alltraps>

0010240d <vector165>:
.globl vector165
vector165:
  pushl $0
  10240d:	6a 00                	push   $0x0
  pushl $165
  10240f:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102414:	e9 a6 f9 ff ff       	jmp    101dbf <__alltraps>

00102419 <vector166>:
.globl vector166
vector166:
  pushl $0
  102419:	6a 00                	push   $0x0
  pushl $166
  10241b:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102420:	e9 9a f9 ff ff       	jmp    101dbf <__alltraps>

00102425 <vector167>:
.globl vector167
vector167:
  pushl $0
  102425:	6a 00                	push   $0x0
  pushl $167
  102427:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10242c:	e9 8e f9 ff ff       	jmp    101dbf <__alltraps>

00102431 <vector168>:
.globl vector168
vector168:
  pushl $0
  102431:	6a 00                	push   $0x0
  pushl $168
  102433:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102438:	e9 82 f9 ff ff       	jmp    101dbf <__alltraps>

0010243d <vector169>:
.globl vector169
vector169:
  pushl $0
  10243d:	6a 00                	push   $0x0
  pushl $169
  10243f:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102444:	e9 76 f9 ff ff       	jmp    101dbf <__alltraps>

00102449 <vector170>:
.globl vector170
vector170:
  pushl $0
  102449:	6a 00                	push   $0x0
  pushl $170
  10244b:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102450:	e9 6a f9 ff ff       	jmp    101dbf <__alltraps>

00102455 <vector171>:
.globl vector171
vector171:
  pushl $0
  102455:	6a 00                	push   $0x0
  pushl $171
  102457:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10245c:	e9 5e f9 ff ff       	jmp    101dbf <__alltraps>

00102461 <vector172>:
.globl vector172
vector172:
  pushl $0
  102461:	6a 00                	push   $0x0
  pushl $172
  102463:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102468:	e9 52 f9 ff ff       	jmp    101dbf <__alltraps>

0010246d <vector173>:
.globl vector173
vector173:
  pushl $0
  10246d:	6a 00                	push   $0x0
  pushl $173
  10246f:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102474:	e9 46 f9 ff ff       	jmp    101dbf <__alltraps>

00102479 <vector174>:
.globl vector174
vector174:
  pushl $0
  102479:	6a 00                	push   $0x0
  pushl $174
  10247b:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102480:	e9 3a f9 ff ff       	jmp    101dbf <__alltraps>

00102485 <vector175>:
.globl vector175
vector175:
  pushl $0
  102485:	6a 00                	push   $0x0
  pushl $175
  102487:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10248c:	e9 2e f9 ff ff       	jmp    101dbf <__alltraps>

00102491 <vector176>:
.globl vector176
vector176:
  pushl $0
  102491:	6a 00                	push   $0x0
  pushl $176
  102493:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102498:	e9 22 f9 ff ff       	jmp    101dbf <__alltraps>

0010249d <vector177>:
.globl vector177
vector177:
  pushl $0
  10249d:	6a 00                	push   $0x0
  pushl $177
  10249f:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1024a4:	e9 16 f9 ff ff       	jmp    101dbf <__alltraps>

001024a9 <vector178>:
.globl vector178
vector178:
  pushl $0
  1024a9:	6a 00                	push   $0x0
  pushl $178
  1024ab:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1024b0:	e9 0a f9 ff ff       	jmp    101dbf <__alltraps>

001024b5 <vector179>:
.globl vector179
vector179:
  pushl $0
  1024b5:	6a 00                	push   $0x0
  pushl $179
  1024b7:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1024bc:	e9 fe f8 ff ff       	jmp    101dbf <__alltraps>

001024c1 <vector180>:
.globl vector180
vector180:
  pushl $0
  1024c1:	6a 00                	push   $0x0
  pushl $180
  1024c3:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1024c8:	e9 f2 f8 ff ff       	jmp    101dbf <__alltraps>

001024cd <vector181>:
.globl vector181
vector181:
  pushl $0
  1024cd:	6a 00                	push   $0x0
  pushl $181
  1024cf:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1024d4:	e9 e6 f8 ff ff       	jmp    101dbf <__alltraps>

001024d9 <vector182>:
.globl vector182
vector182:
  pushl $0
  1024d9:	6a 00                	push   $0x0
  pushl $182
  1024db:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1024e0:	e9 da f8 ff ff       	jmp    101dbf <__alltraps>

001024e5 <vector183>:
.globl vector183
vector183:
  pushl $0
  1024e5:	6a 00                	push   $0x0
  pushl $183
  1024e7:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1024ec:	e9 ce f8 ff ff       	jmp    101dbf <__alltraps>

001024f1 <vector184>:
.globl vector184
vector184:
  pushl $0
  1024f1:	6a 00                	push   $0x0
  pushl $184
  1024f3:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1024f8:	e9 c2 f8 ff ff       	jmp    101dbf <__alltraps>

001024fd <vector185>:
.globl vector185
vector185:
  pushl $0
  1024fd:	6a 00                	push   $0x0
  pushl $185
  1024ff:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102504:	e9 b6 f8 ff ff       	jmp    101dbf <__alltraps>

00102509 <vector186>:
.globl vector186
vector186:
  pushl $0
  102509:	6a 00                	push   $0x0
  pushl $186
  10250b:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102510:	e9 aa f8 ff ff       	jmp    101dbf <__alltraps>

00102515 <vector187>:
.globl vector187
vector187:
  pushl $0
  102515:	6a 00                	push   $0x0
  pushl $187
  102517:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  10251c:	e9 9e f8 ff ff       	jmp    101dbf <__alltraps>

00102521 <vector188>:
.globl vector188
vector188:
  pushl $0
  102521:	6a 00                	push   $0x0
  pushl $188
  102523:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102528:	e9 92 f8 ff ff       	jmp    101dbf <__alltraps>

0010252d <vector189>:
.globl vector189
vector189:
  pushl $0
  10252d:	6a 00                	push   $0x0
  pushl $189
  10252f:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102534:	e9 86 f8 ff ff       	jmp    101dbf <__alltraps>

00102539 <vector190>:
.globl vector190
vector190:
  pushl $0
  102539:	6a 00                	push   $0x0
  pushl $190
  10253b:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102540:	e9 7a f8 ff ff       	jmp    101dbf <__alltraps>

00102545 <vector191>:
.globl vector191
vector191:
  pushl $0
  102545:	6a 00                	push   $0x0
  pushl $191
  102547:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10254c:	e9 6e f8 ff ff       	jmp    101dbf <__alltraps>

00102551 <vector192>:
.globl vector192
vector192:
  pushl $0
  102551:	6a 00                	push   $0x0
  pushl $192
  102553:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102558:	e9 62 f8 ff ff       	jmp    101dbf <__alltraps>

0010255d <vector193>:
.globl vector193
vector193:
  pushl $0
  10255d:	6a 00                	push   $0x0
  pushl $193
  10255f:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102564:	e9 56 f8 ff ff       	jmp    101dbf <__alltraps>

00102569 <vector194>:
.globl vector194
vector194:
  pushl $0
  102569:	6a 00                	push   $0x0
  pushl $194
  10256b:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102570:	e9 4a f8 ff ff       	jmp    101dbf <__alltraps>

00102575 <vector195>:
.globl vector195
vector195:
  pushl $0
  102575:	6a 00                	push   $0x0
  pushl $195
  102577:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10257c:	e9 3e f8 ff ff       	jmp    101dbf <__alltraps>

00102581 <vector196>:
.globl vector196
vector196:
  pushl $0
  102581:	6a 00                	push   $0x0
  pushl $196
  102583:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102588:	e9 32 f8 ff ff       	jmp    101dbf <__alltraps>

0010258d <vector197>:
.globl vector197
vector197:
  pushl $0
  10258d:	6a 00                	push   $0x0
  pushl $197
  10258f:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102594:	e9 26 f8 ff ff       	jmp    101dbf <__alltraps>

00102599 <vector198>:
.globl vector198
vector198:
  pushl $0
  102599:	6a 00                	push   $0x0
  pushl $198
  10259b:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1025a0:	e9 1a f8 ff ff       	jmp    101dbf <__alltraps>

001025a5 <vector199>:
.globl vector199
vector199:
  pushl $0
  1025a5:	6a 00                	push   $0x0
  pushl $199
  1025a7:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1025ac:	e9 0e f8 ff ff       	jmp    101dbf <__alltraps>

001025b1 <vector200>:
.globl vector200
vector200:
  pushl $0
  1025b1:	6a 00                	push   $0x0
  pushl $200
  1025b3:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1025b8:	e9 02 f8 ff ff       	jmp    101dbf <__alltraps>

001025bd <vector201>:
.globl vector201
vector201:
  pushl $0
  1025bd:	6a 00                	push   $0x0
  pushl $201
  1025bf:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1025c4:	e9 f6 f7 ff ff       	jmp    101dbf <__alltraps>

001025c9 <vector202>:
.globl vector202
vector202:
  pushl $0
  1025c9:	6a 00                	push   $0x0
  pushl $202
  1025cb:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1025d0:	e9 ea f7 ff ff       	jmp    101dbf <__alltraps>

001025d5 <vector203>:
.globl vector203
vector203:
  pushl $0
  1025d5:	6a 00                	push   $0x0
  pushl $203
  1025d7:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1025dc:	e9 de f7 ff ff       	jmp    101dbf <__alltraps>

001025e1 <vector204>:
.globl vector204
vector204:
  pushl $0
  1025e1:	6a 00                	push   $0x0
  pushl $204
  1025e3:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1025e8:	e9 d2 f7 ff ff       	jmp    101dbf <__alltraps>

001025ed <vector205>:
.globl vector205
vector205:
  pushl $0
  1025ed:	6a 00                	push   $0x0
  pushl $205
  1025ef:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1025f4:	e9 c6 f7 ff ff       	jmp    101dbf <__alltraps>

001025f9 <vector206>:
.globl vector206
vector206:
  pushl $0
  1025f9:	6a 00                	push   $0x0
  pushl $206
  1025fb:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102600:	e9 ba f7 ff ff       	jmp    101dbf <__alltraps>

00102605 <vector207>:
.globl vector207
vector207:
  pushl $0
  102605:	6a 00                	push   $0x0
  pushl $207
  102607:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  10260c:	e9 ae f7 ff ff       	jmp    101dbf <__alltraps>

00102611 <vector208>:
.globl vector208
vector208:
  pushl $0
  102611:	6a 00                	push   $0x0
  pushl $208
  102613:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102618:	e9 a2 f7 ff ff       	jmp    101dbf <__alltraps>

0010261d <vector209>:
.globl vector209
vector209:
  pushl $0
  10261d:	6a 00                	push   $0x0
  pushl $209
  10261f:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102624:	e9 96 f7 ff ff       	jmp    101dbf <__alltraps>

00102629 <vector210>:
.globl vector210
vector210:
  pushl $0
  102629:	6a 00                	push   $0x0
  pushl $210
  10262b:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102630:	e9 8a f7 ff ff       	jmp    101dbf <__alltraps>

00102635 <vector211>:
.globl vector211
vector211:
  pushl $0
  102635:	6a 00                	push   $0x0
  pushl $211
  102637:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10263c:	e9 7e f7 ff ff       	jmp    101dbf <__alltraps>

00102641 <vector212>:
.globl vector212
vector212:
  pushl $0
  102641:	6a 00                	push   $0x0
  pushl $212
  102643:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102648:	e9 72 f7 ff ff       	jmp    101dbf <__alltraps>

0010264d <vector213>:
.globl vector213
vector213:
  pushl $0
  10264d:	6a 00                	push   $0x0
  pushl $213
  10264f:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102654:	e9 66 f7 ff ff       	jmp    101dbf <__alltraps>

00102659 <vector214>:
.globl vector214
vector214:
  pushl $0
  102659:	6a 00                	push   $0x0
  pushl $214
  10265b:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102660:	e9 5a f7 ff ff       	jmp    101dbf <__alltraps>

00102665 <vector215>:
.globl vector215
vector215:
  pushl $0
  102665:	6a 00                	push   $0x0
  pushl $215
  102667:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10266c:	e9 4e f7 ff ff       	jmp    101dbf <__alltraps>

00102671 <vector216>:
.globl vector216
vector216:
  pushl $0
  102671:	6a 00                	push   $0x0
  pushl $216
  102673:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102678:	e9 42 f7 ff ff       	jmp    101dbf <__alltraps>

0010267d <vector217>:
.globl vector217
vector217:
  pushl $0
  10267d:	6a 00                	push   $0x0
  pushl $217
  10267f:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102684:	e9 36 f7 ff ff       	jmp    101dbf <__alltraps>

00102689 <vector218>:
.globl vector218
vector218:
  pushl $0
  102689:	6a 00                	push   $0x0
  pushl $218
  10268b:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102690:	e9 2a f7 ff ff       	jmp    101dbf <__alltraps>

00102695 <vector219>:
.globl vector219
vector219:
  pushl $0
  102695:	6a 00                	push   $0x0
  pushl $219
  102697:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10269c:	e9 1e f7 ff ff       	jmp    101dbf <__alltraps>

001026a1 <vector220>:
.globl vector220
vector220:
  pushl $0
  1026a1:	6a 00                	push   $0x0
  pushl $220
  1026a3:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1026a8:	e9 12 f7 ff ff       	jmp    101dbf <__alltraps>

001026ad <vector221>:
.globl vector221
vector221:
  pushl $0
  1026ad:	6a 00                	push   $0x0
  pushl $221
  1026af:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1026b4:	e9 06 f7 ff ff       	jmp    101dbf <__alltraps>

001026b9 <vector222>:
.globl vector222
vector222:
  pushl $0
  1026b9:	6a 00                	push   $0x0
  pushl $222
  1026bb:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1026c0:	e9 fa f6 ff ff       	jmp    101dbf <__alltraps>

001026c5 <vector223>:
.globl vector223
vector223:
  pushl $0
  1026c5:	6a 00                	push   $0x0
  pushl $223
  1026c7:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1026cc:	e9 ee f6 ff ff       	jmp    101dbf <__alltraps>

001026d1 <vector224>:
.globl vector224
vector224:
  pushl $0
  1026d1:	6a 00                	push   $0x0
  pushl $224
  1026d3:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1026d8:	e9 e2 f6 ff ff       	jmp    101dbf <__alltraps>

001026dd <vector225>:
.globl vector225
vector225:
  pushl $0
  1026dd:	6a 00                	push   $0x0
  pushl $225
  1026df:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1026e4:	e9 d6 f6 ff ff       	jmp    101dbf <__alltraps>

001026e9 <vector226>:
.globl vector226
vector226:
  pushl $0
  1026e9:	6a 00                	push   $0x0
  pushl $226
  1026eb:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1026f0:	e9 ca f6 ff ff       	jmp    101dbf <__alltraps>

001026f5 <vector227>:
.globl vector227
vector227:
  pushl $0
  1026f5:	6a 00                	push   $0x0
  pushl $227
  1026f7:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1026fc:	e9 be f6 ff ff       	jmp    101dbf <__alltraps>

00102701 <vector228>:
.globl vector228
vector228:
  pushl $0
  102701:	6a 00                	push   $0x0
  pushl $228
  102703:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102708:	e9 b2 f6 ff ff       	jmp    101dbf <__alltraps>

0010270d <vector229>:
.globl vector229
vector229:
  pushl $0
  10270d:	6a 00                	push   $0x0
  pushl $229
  10270f:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102714:	e9 a6 f6 ff ff       	jmp    101dbf <__alltraps>

00102719 <vector230>:
.globl vector230
vector230:
  pushl $0
  102719:	6a 00                	push   $0x0
  pushl $230
  10271b:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102720:	e9 9a f6 ff ff       	jmp    101dbf <__alltraps>

00102725 <vector231>:
.globl vector231
vector231:
  pushl $0
  102725:	6a 00                	push   $0x0
  pushl $231
  102727:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10272c:	e9 8e f6 ff ff       	jmp    101dbf <__alltraps>

00102731 <vector232>:
.globl vector232
vector232:
  pushl $0
  102731:	6a 00                	push   $0x0
  pushl $232
  102733:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102738:	e9 82 f6 ff ff       	jmp    101dbf <__alltraps>

0010273d <vector233>:
.globl vector233
vector233:
  pushl $0
  10273d:	6a 00                	push   $0x0
  pushl $233
  10273f:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102744:	e9 76 f6 ff ff       	jmp    101dbf <__alltraps>

00102749 <vector234>:
.globl vector234
vector234:
  pushl $0
  102749:	6a 00                	push   $0x0
  pushl $234
  10274b:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102750:	e9 6a f6 ff ff       	jmp    101dbf <__alltraps>

00102755 <vector235>:
.globl vector235
vector235:
  pushl $0
  102755:	6a 00                	push   $0x0
  pushl $235
  102757:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10275c:	e9 5e f6 ff ff       	jmp    101dbf <__alltraps>

00102761 <vector236>:
.globl vector236
vector236:
  pushl $0
  102761:	6a 00                	push   $0x0
  pushl $236
  102763:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102768:	e9 52 f6 ff ff       	jmp    101dbf <__alltraps>

0010276d <vector237>:
.globl vector237
vector237:
  pushl $0
  10276d:	6a 00                	push   $0x0
  pushl $237
  10276f:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102774:	e9 46 f6 ff ff       	jmp    101dbf <__alltraps>

00102779 <vector238>:
.globl vector238
vector238:
  pushl $0
  102779:	6a 00                	push   $0x0
  pushl $238
  10277b:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102780:	e9 3a f6 ff ff       	jmp    101dbf <__alltraps>

00102785 <vector239>:
.globl vector239
vector239:
  pushl $0
  102785:	6a 00                	push   $0x0
  pushl $239
  102787:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10278c:	e9 2e f6 ff ff       	jmp    101dbf <__alltraps>

00102791 <vector240>:
.globl vector240
vector240:
  pushl $0
  102791:	6a 00                	push   $0x0
  pushl $240
  102793:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102798:	e9 22 f6 ff ff       	jmp    101dbf <__alltraps>

0010279d <vector241>:
.globl vector241
vector241:
  pushl $0
  10279d:	6a 00                	push   $0x0
  pushl $241
  10279f:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1027a4:	e9 16 f6 ff ff       	jmp    101dbf <__alltraps>

001027a9 <vector242>:
.globl vector242
vector242:
  pushl $0
  1027a9:	6a 00                	push   $0x0
  pushl $242
  1027ab:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1027b0:	e9 0a f6 ff ff       	jmp    101dbf <__alltraps>

001027b5 <vector243>:
.globl vector243
vector243:
  pushl $0
  1027b5:	6a 00                	push   $0x0
  pushl $243
  1027b7:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1027bc:	e9 fe f5 ff ff       	jmp    101dbf <__alltraps>

001027c1 <vector244>:
.globl vector244
vector244:
  pushl $0
  1027c1:	6a 00                	push   $0x0
  pushl $244
  1027c3:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1027c8:	e9 f2 f5 ff ff       	jmp    101dbf <__alltraps>

001027cd <vector245>:
.globl vector245
vector245:
  pushl $0
  1027cd:	6a 00                	push   $0x0
  pushl $245
  1027cf:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1027d4:	e9 e6 f5 ff ff       	jmp    101dbf <__alltraps>

001027d9 <vector246>:
.globl vector246
vector246:
  pushl $0
  1027d9:	6a 00                	push   $0x0
  pushl $246
  1027db:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1027e0:	e9 da f5 ff ff       	jmp    101dbf <__alltraps>

001027e5 <vector247>:
.globl vector247
vector247:
  pushl $0
  1027e5:	6a 00                	push   $0x0
  pushl $247
  1027e7:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1027ec:	e9 ce f5 ff ff       	jmp    101dbf <__alltraps>

001027f1 <vector248>:
.globl vector248
vector248:
  pushl $0
  1027f1:	6a 00                	push   $0x0
  pushl $248
  1027f3:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1027f8:	e9 c2 f5 ff ff       	jmp    101dbf <__alltraps>

001027fd <vector249>:
.globl vector249
vector249:
  pushl $0
  1027fd:	6a 00                	push   $0x0
  pushl $249
  1027ff:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102804:	e9 b6 f5 ff ff       	jmp    101dbf <__alltraps>

00102809 <vector250>:
.globl vector250
vector250:
  pushl $0
  102809:	6a 00                	push   $0x0
  pushl $250
  10280b:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102810:	e9 aa f5 ff ff       	jmp    101dbf <__alltraps>

00102815 <vector251>:
.globl vector251
vector251:
  pushl $0
  102815:	6a 00                	push   $0x0
  pushl $251
  102817:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  10281c:	e9 9e f5 ff ff       	jmp    101dbf <__alltraps>

00102821 <vector252>:
.globl vector252
vector252:
  pushl $0
  102821:	6a 00                	push   $0x0
  pushl $252
  102823:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102828:	e9 92 f5 ff ff       	jmp    101dbf <__alltraps>

0010282d <vector253>:
.globl vector253
vector253:
  pushl $0
  10282d:	6a 00                	push   $0x0
  pushl $253
  10282f:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102834:	e9 86 f5 ff ff       	jmp    101dbf <__alltraps>

00102839 <vector254>:
.globl vector254
vector254:
  pushl $0
  102839:	6a 00                	push   $0x0
  pushl $254
  10283b:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102840:	e9 7a f5 ff ff       	jmp    101dbf <__alltraps>

00102845 <vector255>:
.globl vector255
vector255:
  pushl $0
  102845:	6a 00                	push   $0x0
  pushl $255
  102847:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10284c:	e9 6e f5 ff ff       	jmp    101dbf <__alltraps>

00102851 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102851:	55                   	push   %ebp
  102852:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102854:	8b 45 08             	mov    0x8(%ebp),%eax
  102857:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10285a:	b8 23 00 00 00       	mov    $0x23,%eax
  10285f:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102861:	b8 23 00 00 00       	mov    $0x23,%eax
  102866:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102868:	b8 10 00 00 00       	mov    $0x10,%eax
  10286d:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10286f:	b8 10 00 00 00       	mov    $0x10,%eax
  102874:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102876:	b8 10 00 00 00       	mov    $0x10,%eax
  10287b:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10287d:	ea 84 28 10 00 08 00 	ljmp   $0x8,$0x102884
}
  102884:	5d                   	pop    %ebp
  102885:	c3                   	ret    

00102886 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102886:	55                   	push   %ebp
  102887:	89 e5                	mov    %esp,%ebp
  102889:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  10288c:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102891:	05 00 04 00 00       	add    $0x400,%eax
  102896:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  10289b:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1028a2:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1028a4:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1028ab:	68 00 
  1028ad:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1028b2:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1028b8:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1028bd:	c1 e8 10             	shr    $0x10,%eax
  1028c0:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1028c5:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028cc:	83 e0 f0             	and    $0xfffffff0,%eax
  1028cf:	83 c8 09             	or     $0x9,%eax
  1028d2:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028d7:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028de:	83 c8 10             	or     $0x10,%eax
  1028e1:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028e6:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028ed:	83 e0 9f             	and    $0xffffff9f,%eax
  1028f0:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028f5:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028fc:	83 c8 80             	or     $0xffffff80,%eax
  1028ff:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102904:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10290b:	83 e0 f0             	and    $0xfffffff0,%eax
  10290e:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102913:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10291a:	83 e0 ef             	and    $0xffffffef,%eax
  10291d:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102922:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102929:	83 e0 df             	and    $0xffffffdf,%eax
  10292c:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102931:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102938:	83 c8 40             	or     $0x40,%eax
  10293b:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102940:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102947:	83 e0 7f             	and    $0x7f,%eax
  10294a:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10294f:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102954:	c1 e8 18             	shr    $0x18,%eax
  102957:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  10295c:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102963:	83 e0 ef             	and    $0xffffffef,%eax
  102966:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  10296b:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102972:	e8 da fe ff ff       	call   102851 <lgdt>
  102977:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  10297d:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102981:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102984:	c9                   	leave  
  102985:	c3                   	ret    

00102986 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102986:	55                   	push   %ebp
  102987:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102989:	e8 f8 fe ff ff       	call   102886 <gdt_init>
}
  10298e:	5d                   	pop    %ebp
  10298f:	c3                   	ret    

00102990 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102990:	55                   	push   %ebp
  102991:	89 e5                	mov    %esp,%ebp
  102993:	83 ec 58             	sub    $0x58,%esp
  102996:	8b 45 10             	mov    0x10(%ebp),%eax
  102999:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10299c:	8b 45 14             	mov    0x14(%ebp),%eax
  10299f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  1029a2:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1029a5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1029a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1029ab:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  1029ae:	8b 45 18             	mov    0x18(%ebp),%eax
  1029b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1029b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1029b7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1029ba:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1029bd:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1029c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1029c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1029ca:	74 1c                	je     1029e8 <printnum+0x58>
  1029cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029cf:	ba 00 00 00 00       	mov    $0x0,%edx
  1029d4:	f7 75 e4             	divl   -0x1c(%ebp)
  1029d7:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1029da:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029dd:	ba 00 00 00 00       	mov    $0x0,%edx
  1029e2:	f7 75 e4             	divl   -0x1c(%ebp)
  1029e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1029e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1029eb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1029ee:	f7 75 e4             	divl   -0x1c(%ebp)
  1029f1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1029f4:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1029f7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1029fa:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1029fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a00:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102a03:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102a06:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102a09:	8b 45 18             	mov    0x18(%ebp),%eax
  102a0c:	ba 00 00 00 00       	mov    $0x0,%edx
  102a11:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102a14:	77 56                	ja     102a6c <printnum+0xdc>
  102a16:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102a19:	72 05                	jb     102a20 <printnum+0x90>
  102a1b:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102a1e:	77 4c                	ja     102a6c <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102a20:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102a23:	8d 50 ff             	lea    -0x1(%eax),%edx
  102a26:	8b 45 20             	mov    0x20(%ebp),%eax
  102a29:	89 44 24 18          	mov    %eax,0x18(%esp)
  102a2d:	89 54 24 14          	mov    %edx,0x14(%esp)
  102a31:	8b 45 18             	mov    0x18(%ebp),%eax
  102a34:	89 44 24 10          	mov    %eax,0x10(%esp)
  102a38:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102a3b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102a3e:	89 44 24 08          	mov    %eax,0x8(%esp)
  102a42:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102a46:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a49:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a4d:	8b 45 08             	mov    0x8(%ebp),%eax
  102a50:	89 04 24             	mov    %eax,(%esp)
  102a53:	e8 38 ff ff ff       	call   102990 <printnum>
  102a58:	eb 1c                	jmp    102a76 <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102a5a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a61:	8b 45 20             	mov    0x20(%ebp),%eax
  102a64:	89 04 24             	mov    %eax,(%esp)
  102a67:	8b 45 08             	mov    0x8(%ebp),%eax
  102a6a:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102a6c:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102a70:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102a74:	7f e4                	jg     102a5a <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102a76:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102a79:	05 70 3c 10 00       	add    $0x103c70,%eax
  102a7e:	0f b6 00             	movzbl (%eax),%eax
  102a81:	0f be c0             	movsbl %al,%eax
  102a84:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a87:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a8b:	89 04 24             	mov    %eax,(%esp)
  102a8e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a91:	ff d0                	call   *%eax
}
  102a93:	c9                   	leave  
  102a94:	c3                   	ret    

00102a95 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102a95:	55                   	push   %ebp
  102a96:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a98:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a9c:	7e 14                	jle    102ab2 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102a9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa1:	8b 00                	mov    (%eax),%eax
  102aa3:	8d 48 08             	lea    0x8(%eax),%ecx
  102aa6:	8b 55 08             	mov    0x8(%ebp),%edx
  102aa9:	89 0a                	mov    %ecx,(%edx)
  102aab:	8b 50 04             	mov    0x4(%eax),%edx
  102aae:	8b 00                	mov    (%eax),%eax
  102ab0:	eb 30                	jmp    102ae2 <getuint+0x4d>
    }
    else if (lflag) {
  102ab2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ab6:	74 16                	je     102ace <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102ab8:	8b 45 08             	mov    0x8(%ebp),%eax
  102abb:	8b 00                	mov    (%eax),%eax
  102abd:	8d 48 04             	lea    0x4(%eax),%ecx
  102ac0:	8b 55 08             	mov    0x8(%ebp),%edx
  102ac3:	89 0a                	mov    %ecx,(%edx)
  102ac5:	8b 00                	mov    (%eax),%eax
  102ac7:	ba 00 00 00 00       	mov    $0x0,%edx
  102acc:	eb 14                	jmp    102ae2 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102ace:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad1:	8b 00                	mov    (%eax),%eax
  102ad3:	8d 48 04             	lea    0x4(%eax),%ecx
  102ad6:	8b 55 08             	mov    0x8(%ebp),%edx
  102ad9:	89 0a                	mov    %ecx,(%edx)
  102adb:	8b 00                	mov    (%eax),%eax
  102add:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102ae2:	5d                   	pop    %ebp
  102ae3:	c3                   	ret    

00102ae4 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102ae4:	55                   	push   %ebp
  102ae5:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102ae7:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102aeb:	7e 14                	jle    102b01 <getint+0x1d>
        return va_arg(*ap, long long);
  102aed:	8b 45 08             	mov    0x8(%ebp),%eax
  102af0:	8b 00                	mov    (%eax),%eax
  102af2:	8d 48 08             	lea    0x8(%eax),%ecx
  102af5:	8b 55 08             	mov    0x8(%ebp),%edx
  102af8:	89 0a                	mov    %ecx,(%edx)
  102afa:	8b 50 04             	mov    0x4(%eax),%edx
  102afd:	8b 00                	mov    (%eax),%eax
  102aff:	eb 28                	jmp    102b29 <getint+0x45>
    }
    else if (lflag) {
  102b01:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102b05:	74 12                	je     102b19 <getint+0x35>
        return va_arg(*ap, long);
  102b07:	8b 45 08             	mov    0x8(%ebp),%eax
  102b0a:	8b 00                	mov    (%eax),%eax
  102b0c:	8d 48 04             	lea    0x4(%eax),%ecx
  102b0f:	8b 55 08             	mov    0x8(%ebp),%edx
  102b12:	89 0a                	mov    %ecx,(%edx)
  102b14:	8b 00                	mov    (%eax),%eax
  102b16:	99                   	cltd   
  102b17:	eb 10                	jmp    102b29 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102b19:	8b 45 08             	mov    0x8(%ebp),%eax
  102b1c:	8b 00                	mov    (%eax),%eax
  102b1e:	8d 48 04             	lea    0x4(%eax),%ecx
  102b21:	8b 55 08             	mov    0x8(%ebp),%edx
  102b24:	89 0a                	mov    %ecx,(%edx)
  102b26:	8b 00                	mov    (%eax),%eax
  102b28:	99                   	cltd   
    }
}
  102b29:	5d                   	pop    %ebp
  102b2a:	c3                   	ret    

00102b2b <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102b2b:	55                   	push   %ebp
  102b2c:	89 e5                	mov    %esp,%ebp
  102b2e:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102b31:	8d 45 14             	lea    0x14(%ebp),%eax
  102b34:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b3a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102b3e:	8b 45 10             	mov    0x10(%ebp),%eax
  102b41:	89 44 24 08          	mov    %eax,0x8(%esp)
  102b45:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b48:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b4c:	8b 45 08             	mov    0x8(%ebp),%eax
  102b4f:	89 04 24             	mov    %eax,(%esp)
  102b52:	e8 02 00 00 00       	call   102b59 <vprintfmt>
    va_end(ap);
}
  102b57:	c9                   	leave  
  102b58:	c3                   	ret    

00102b59 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102b59:	55                   	push   %ebp
  102b5a:	89 e5                	mov    %esp,%ebp
  102b5c:	56                   	push   %esi
  102b5d:	53                   	push   %ebx
  102b5e:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b61:	eb 18                	jmp    102b7b <vprintfmt+0x22>
            if (ch == '\0') {
  102b63:	85 db                	test   %ebx,%ebx
  102b65:	75 05                	jne    102b6c <vprintfmt+0x13>
                return;
  102b67:	e9 d1 03 00 00       	jmp    102f3d <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102b6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b6f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b73:	89 1c 24             	mov    %ebx,(%esp)
  102b76:	8b 45 08             	mov    0x8(%ebp),%eax
  102b79:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b7b:	8b 45 10             	mov    0x10(%ebp),%eax
  102b7e:	8d 50 01             	lea    0x1(%eax),%edx
  102b81:	89 55 10             	mov    %edx,0x10(%ebp)
  102b84:	0f b6 00             	movzbl (%eax),%eax
  102b87:	0f b6 d8             	movzbl %al,%ebx
  102b8a:	83 fb 25             	cmp    $0x25,%ebx
  102b8d:	75 d4                	jne    102b63 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102b8f:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102b93:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102b9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b9d:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102ba0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102ba7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102baa:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102bad:	8b 45 10             	mov    0x10(%ebp),%eax
  102bb0:	8d 50 01             	lea    0x1(%eax),%edx
  102bb3:	89 55 10             	mov    %edx,0x10(%ebp)
  102bb6:	0f b6 00             	movzbl (%eax),%eax
  102bb9:	0f b6 d8             	movzbl %al,%ebx
  102bbc:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102bbf:	83 f8 55             	cmp    $0x55,%eax
  102bc2:	0f 87 44 03 00 00    	ja     102f0c <vprintfmt+0x3b3>
  102bc8:	8b 04 85 94 3c 10 00 	mov    0x103c94(,%eax,4),%eax
  102bcf:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102bd1:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102bd5:	eb d6                	jmp    102bad <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102bd7:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102bdb:	eb d0                	jmp    102bad <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102bdd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102be4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102be7:	89 d0                	mov    %edx,%eax
  102be9:	c1 e0 02             	shl    $0x2,%eax
  102bec:	01 d0                	add    %edx,%eax
  102bee:	01 c0                	add    %eax,%eax
  102bf0:	01 d8                	add    %ebx,%eax
  102bf2:	83 e8 30             	sub    $0x30,%eax
  102bf5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102bf8:	8b 45 10             	mov    0x10(%ebp),%eax
  102bfb:	0f b6 00             	movzbl (%eax),%eax
  102bfe:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102c01:	83 fb 2f             	cmp    $0x2f,%ebx
  102c04:	7e 0b                	jle    102c11 <vprintfmt+0xb8>
  102c06:	83 fb 39             	cmp    $0x39,%ebx
  102c09:	7f 06                	jg     102c11 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102c0b:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102c0f:	eb d3                	jmp    102be4 <vprintfmt+0x8b>
            goto process_precision;
  102c11:	eb 33                	jmp    102c46 <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102c13:	8b 45 14             	mov    0x14(%ebp),%eax
  102c16:	8d 50 04             	lea    0x4(%eax),%edx
  102c19:	89 55 14             	mov    %edx,0x14(%ebp)
  102c1c:	8b 00                	mov    (%eax),%eax
  102c1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102c21:	eb 23                	jmp    102c46 <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102c23:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c27:	79 0c                	jns    102c35 <vprintfmt+0xdc>
                width = 0;
  102c29:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102c30:	e9 78 ff ff ff       	jmp    102bad <vprintfmt+0x54>
  102c35:	e9 73 ff ff ff       	jmp    102bad <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102c3a:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102c41:	e9 67 ff ff ff       	jmp    102bad <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102c46:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c4a:	79 12                	jns    102c5e <vprintfmt+0x105>
                width = precision, precision = -1;
  102c4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c52:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102c59:	e9 4f ff ff ff       	jmp    102bad <vprintfmt+0x54>
  102c5e:	e9 4a ff ff ff       	jmp    102bad <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102c63:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102c67:	e9 41 ff ff ff       	jmp    102bad <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102c6c:	8b 45 14             	mov    0x14(%ebp),%eax
  102c6f:	8d 50 04             	lea    0x4(%eax),%edx
  102c72:	89 55 14             	mov    %edx,0x14(%ebp)
  102c75:	8b 00                	mov    (%eax),%eax
  102c77:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c7a:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c7e:	89 04 24             	mov    %eax,(%esp)
  102c81:	8b 45 08             	mov    0x8(%ebp),%eax
  102c84:	ff d0                	call   *%eax
            break;
  102c86:	e9 ac 02 00 00       	jmp    102f37 <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102c8b:	8b 45 14             	mov    0x14(%ebp),%eax
  102c8e:	8d 50 04             	lea    0x4(%eax),%edx
  102c91:	89 55 14             	mov    %edx,0x14(%ebp)
  102c94:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102c96:	85 db                	test   %ebx,%ebx
  102c98:	79 02                	jns    102c9c <vprintfmt+0x143>
                err = -err;
  102c9a:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102c9c:	83 fb 06             	cmp    $0x6,%ebx
  102c9f:	7f 0b                	jg     102cac <vprintfmt+0x153>
  102ca1:	8b 34 9d 54 3c 10 00 	mov    0x103c54(,%ebx,4),%esi
  102ca8:	85 f6                	test   %esi,%esi
  102caa:	75 23                	jne    102ccf <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102cac:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102cb0:	c7 44 24 08 81 3c 10 	movl   $0x103c81,0x8(%esp)
  102cb7:	00 
  102cb8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cbb:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cbf:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc2:	89 04 24             	mov    %eax,(%esp)
  102cc5:	e8 61 fe ff ff       	call   102b2b <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102cca:	e9 68 02 00 00       	jmp    102f37 <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102ccf:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102cd3:	c7 44 24 08 8a 3c 10 	movl   $0x103c8a,0x8(%esp)
  102cda:	00 
  102cdb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cde:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ce2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce5:	89 04 24             	mov    %eax,(%esp)
  102ce8:	e8 3e fe ff ff       	call   102b2b <printfmt>
            }
            break;
  102ced:	e9 45 02 00 00       	jmp    102f37 <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102cf2:	8b 45 14             	mov    0x14(%ebp),%eax
  102cf5:	8d 50 04             	lea    0x4(%eax),%edx
  102cf8:	89 55 14             	mov    %edx,0x14(%ebp)
  102cfb:	8b 30                	mov    (%eax),%esi
  102cfd:	85 f6                	test   %esi,%esi
  102cff:	75 05                	jne    102d06 <vprintfmt+0x1ad>
                p = "(null)";
  102d01:	be 8d 3c 10 00       	mov    $0x103c8d,%esi
            }
            if (width > 0 && padc != '-') {
  102d06:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d0a:	7e 3e                	jle    102d4a <vprintfmt+0x1f1>
  102d0c:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102d10:	74 38                	je     102d4a <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102d12:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102d15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d18:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d1c:	89 34 24             	mov    %esi,(%esp)
  102d1f:	e8 15 03 00 00       	call   103039 <strnlen>
  102d24:	29 c3                	sub    %eax,%ebx
  102d26:	89 d8                	mov    %ebx,%eax
  102d28:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d2b:	eb 17                	jmp    102d44 <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102d2d:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102d31:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d34:	89 54 24 04          	mov    %edx,0x4(%esp)
  102d38:	89 04 24             	mov    %eax,(%esp)
  102d3b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3e:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102d40:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d44:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d48:	7f e3                	jg     102d2d <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d4a:	eb 38                	jmp    102d84 <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102d4c:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102d50:	74 1f                	je     102d71 <vprintfmt+0x218>
  102d52:	83 fb 1f             	cmp    $0x1f,%ebx
  102d55:	7e 05                	jle    102d5c <vprintfmt+0x203>
  102d57:	83 fb 7e             	cmp    $0x7e,%ebx
  102d5a:	7e 15                	jle    102d71 <vprintfmt+0x218>
                    putch('?', putdat);
  102d5c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d5f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d63:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102d6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6d:	ff d0                	call   *%eax
  102d6f:	eb 0f                	jmp    102d80 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102d71:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d74:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d78:	89 1c 24             	mov    %ebx,(%esp)
  102d7b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d7e:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d80:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d84:	89 f0                	mov    %esi,%eax
  102d86:	8d 70 01             	lea    0x1(%eax),%esi
  102d89:	0f b6 00             	movzbl (%eax),%eax
  102d8c:	0f be d8             	movsbl %al,%ebx
  102d8f:	85 db                	test   %ebx,%ebx
  102d91:	74 10                	je     102da3 <vprintfmt+0x24a>
  102d93:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d97:	78 b3                	js     102d4c <vprintfmt+0x1f3>
  102d99:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102d9d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102da1:	79 a9                	jns    102d4c <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102da3:	eb 17                	jmp    102dbc <vprintfmt+0x263>
                putch(' ', putdat);
  102da5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102da8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dac:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102db3:	8b 45 08             	mov    0x8(%ebp),%eax
  102db6:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102db8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102dbc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102dc0:	7f e3                	jg     102da5 <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102dc2:	e9 70 01 00 00       	jmp    102f37 <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102dc7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dca:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dce:	8d 45 14             	lea    0x14(%ebp),%eax
  102dd1:	89 04 24             	mov    %eax,(%esp)
  102dd4:	e8 0b fd ff ff       	call   102ae4 <getint>
  102dd9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ddc:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102ddf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102de2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102de5:	85 d2                	test   %edx,%edx
  102de7:	79 26                	jns    102e0f <vprintfmt+0x2b6>
                putch('-', putdat);
  102de9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dec:	89 44 24 04          	mov    %eax,0x4(%esp)
  102df0:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102df7:	8b 45 08             	mov    0x8(%ebp),%eax
  102dfa:	ff d0                	call   *%eax
                num = -(long long)num;
  102dfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dff:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e02:	f7 d8                	neg    %eax
  102e04:	83 d2 00             	adc    $0x0,%edx
  102e07:	f7 da                	neg    %edx
  102e09:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e0c:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102e0f:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102e16:	e9 a8 00 00 00       	jmp    102ec3 <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102e1b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e1e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e22:	8d 45 14             	lea    0x14(%ebp),%eax
  102e25:	89 04 24             	mov    %eax,(%esp)
  102e28:	e8 68 fc ff ff       	call   102a95 <getuint>
  102e2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e30:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102e33:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102e3a:	e9 84 00 00 00       	jmp    102ec3 <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102e3f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e42:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e46:	8d 45 14             	lea    0x14(%ebp),%eax
  102e49:	89 04 24             	mov    %eax,(%esp)
  102e4c:	e8 44 fc ff ff       	call   102a95 <getuint>
  102e51:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e54:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102e57:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102e5e:	eb 63                	jmp    102ec3 <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102e60:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e63:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e67:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102e6e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e71:	ff d0                	call   *%eax
            putch('x', putdat);
  102e73:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e76:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e7a:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102e81:	8b 45 08             	mov    0x8(%ebp),%eax
  102e84:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102e86:	8b 45 14             	mov    0x14(%ebp),%eax
  102e89:	8d 50 04             	lea    0x4(%eax),%edx
  102e8c:	89 55 14             	mov    %edx,0x14(%ebp)
  102e8f:	8b 00                	mov    (%eax),%eax
  102e91:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102e9b:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102ea2:	eb 1f                	jmp    102ec3 <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102ea4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ea7:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eab:	8d 45 14             	lea    0x14(%ebp),%eax
  102eae:	89 04 24             	mov    %eax,(%esp)
  102eb1:	e8 df fb ff ff       	call   102a95 <getuint>
  102eb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102eb9:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102ebc:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102ec3:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102ec7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102eca:	89 54 24 18          	mov    %edx,0x18(%esp)
  102ece:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102ed1:	89 54 24 14          	mov    %edx,0x14(%esp)
  102ed5:	89 44 24 10          	mov    %eax,0x10(%esp)
  102ed9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102edc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102edf:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ee3:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102ee7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eea:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eee:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef1:	89 04 24             	mov    %eax,(%esp)
  102ef4:	e8 97 fa ff ff       	call   102990 <printnum>
            break;
  102ef9:	eb 3c                	jmp    102f37 <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102efb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102efe:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f02:	89 1c 24             	mov    %ebx,(%esp)
  102f05:	8b 45 08             	mov    0x8(%ebp),%eax
  102f08:	ff d0                	call   *%eax
            break;
  102f0a:	eb 2b                	jmp    102f37 <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102f0c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f0f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f13:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102f1a:	8b 45 08             	mov    0x8(%ebp),%eax
  102f1d:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102f1f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f23:	eb 04                	jmp    102f29 <vprintfmt+0x3d0>
  102f25:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f29:	8b 45 10             	mov    0x10(%ebp),%eax
  102f2c:	83 e8 01             	sub    $0x1,%eax
  102f2f:	0f b6 00             	movzbl (%eax),%eax
  102f32:	3c 25                	cmp    $0x25,%al
  102f34:	75 ef                	jne    102f25 <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102f36:	90                   	nop
        }
    }
  102f37:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f38:	e9 3e fc ff ff       	jmp    102b7b <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102f3d:	83 c4 40             	add    $0x40,%esp
  102f40:	5b                   	pop    %ebx
  102f41:	5e                   	pop    %esi
  102f42:	5d                   	pop    %ebp
  102f43:	c3                   	ret    

00102f44 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102f44:	55                   	push   %ebp
  102f45:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102f47:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f4a:	8b 40 08             	mov    0x8(%eax),%eax
  102f4d:	8d 50 01             	lea    0x1(%eax),%edx
  102f50:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f53:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102f56:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f59:	8b 10                	mov    (%eax),%edx
  102f5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f5e:	8b 40 04             	mov    0x4(%eax),%eax
  102f61:	39 c2                	cmp    %eax,%edx
  102f63:	73 12                	jae    102f77 <sprintputch+0x33>
        *b->buf ++ = ch;
  102f65:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f68:	8b 00                	mov    (%eax),%eax
  102f6a:	8d 48 01             	lea    0x1(%eax),%ecx
  102f6d:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f70:	89 0a                	mov    %ecx,(%edx)
  102f72:	8b 55 08             	mov    0x8(%ebp),%edx
  102f75:	88 10                	mov    %dl,(%eax)
    }
}
  102f77:	5d                   	pop    %ebp
  102f78:	c3                   	ret    

00102f79 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102f79:	55                   	push   %ebp
  102f7a:	89 e5                	mov    %esp,%ebp
  102f7c:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102f7f:	8d 45 14             	lea    0x14(%ebp),%eax
  102f82:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102f85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f88:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f8c:	8b 45 10             	mov    0x10(%ebp),%eax
  102f8f:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f93:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f96:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9d:	89 04 24             	mov    %eax,(%esp)
  102fa0:	e8 08 00 00 00       	call   102fad <vsnprintf>
  102fa5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102fa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102fab:	c9                   	leave  
  102fac:	c3                   	ret    

00102fad <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102fad:	55                   	push   %ebp
  102fae:	89 e5                	mov    %esp,%ebp
  102fb0:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102fb3:	8b 45 08             	mov    0x8(%ebp),%eax
  102fb6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102fb9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fbc:	8d 50 ff             	lea    -0x1(%eax),%edx
  102fbf:	8b 45 08             	mov    0x8(%ebp),%eax
  102fc2:	01 d0                	add    %edx,%eax
  102fc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fc7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102fce:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102fd2:	74 0a                	je     102fde <vsnprintf+0x31>
  102fd4:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102fd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fda:	39 c2                	cmp    %eax,%edx
  102fdc:	76 07                	jbe    102fe5 <vsnprintf+0x38>
        return -E_INVAL;
  102fde:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102fe3:	eb 2a                	jmp    10300f <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102fe5:	8b 45 14             	mov    0x14(%ebp),%eax
  102fe8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102fec:	8b 45 10             	mov    0x10(%ebp),%eax
  102fef:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ff3:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102ff6:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ffa:	c7 04 24 44 2f 10 00 	movl   $0x102f44,(%esp)
  103001:	e8 53 fb ff ff       	call   102b59 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  103006:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103009:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10300c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10300f:	c9                   	leave  
  103010:	c3                   	ret    

00103011 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  103011:	55                   	push   %ebp
  103012:	89 e5                	mov    %esp,%ebp
  103014:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  103017:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  10301e:	eb 04                	jmp    103024 <strlen+0x13>
        cnt ++;
  103020:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  103024:	8b 45 08             	mov    0x8(%ebp),%eax
  103027:	8d 50 01             	lea    0x1(%eax),%edx
  10302a:	89 55 08             	mov    %edx,0x8(%ebp)
  10302d:	0f b6 00             	movzbl (%eax),%eax
  103030:	84 c0                	test   %al,%al
  103032:	75 ec                	jne    103020 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  103034:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103037:	c9                   	leave  
  103038:	c3                   	ret    

00103039 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  103039:	55                   	push   %ebp
  10303a:	89 e5                	mov    %esp,%ebp
  10303c:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10303f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103046:	eb 04                	jmp    10304c <strnlen+0x13>
        cnt ++;
  103048:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  10304c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10304f:	3b 45 0c             	cmp    0xc(%ebp),%eax
  103052:	73 10                	jae    103064 <strnlen+0x2b>
  103054:	8b 45 08             	mov    0x8(%ebp),%eax
  103057:	8d 50 01             	lea    0x1(%eax),%edx
  10305a:	89 55 08             	mov    %edx,0x8(%ebp)
  10305d:	0f b6 00             	movzbl (%eax),%eax
  103060:	84 c0                	test   %al,%al
  103062:	75 e4                	jne    103048 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  103064:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103067:	c9                   	leave  
  103068:	c3                   	ret    

00103069 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103069:	55                   	push   %ebp
  10306a:	89 e5                	mov    %esp,%ebp
  10306c:	57                   	push   %edi
  10306d:	56                   	push   %esi
  10306e:	83 ec 20             	sub    $0x20,%esp
  103071:	8b 45 08             	mov    0x8(%ebp),%eax
  103074:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103077:	8b 45 0c             	mov    0xc(%ebp),%eax
  10307a:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  10307d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103080:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103083:	89 d1                	mov    %edx,%ecx
  103085:	89 c2                	mov    %eax,%edx
  103087:	89 ce                	mov    %ecx,%esi
  103089:	89 d7                	mov    %edx,%edi
  10308b:	ac                   	lods   %ds:(%esi),%al
  10308c:	aa                   	stos   %al,%es:(%edi)
  10308d:	84 c0                	test   %al,%al
  10308f:	75 fa                	jne    10308b <strcpy+0x22>
  103091:	89 fa                	mov    %edi,%edx
  103093:	89 f1                	mov    %esi,%ecx
  103095:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103098:	89 55 e8             	mov    %edx,-0x18(%ebp)
  10309b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  10309e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  1030a1:	83 c4 20             	add    $0x20,%esp
  1030a4:	5e                   	pop    %esi
  1030a5:	5f                   	pop    %edi
  1030a6:	5d                   	pop    %ebp
  1030a7:	c3                   	ret    

001030a8 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  1030a8:	55                   	push   %ebp
  1030a9:	89 e5                	mov    %esp,%ebp
  1030ab:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  1030ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1030b4:	eb 21                	jmp    1030d7 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  1030b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030b9:	0f b6 10             	movzbl (%eax),%edx
  1030bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030bf:	88 10                	mov    %dl,(%eax)
  1030c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030c4:	0f b6 00             	movzbl (%eax),%eax
  1030c7:	84 c0                	test   %al,%al
  1030c9:	74 04                	je     1030cf <strncpy+0x27>
            src ++;
  1030cb:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  1030cf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1030d3:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  1030d7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030db:	75 d9                	jne    1030b6 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  1030dd:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1030e0:	c9                   	leave  
  1030e1:	c3                   	ret    

001030e2 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1030e2:	55                   	push   %ebp
  1030e3:	89 e5                	mov    %esp,%ebp
  1030e5:	57                   	push   %edi
  1030e6:	56                   	push   %esi
  1030e7:	83 ec 20             	sub    $0x20,%esp
  1030ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  1030f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030fc:	89 d1                	mov    %edx,%ecx
  1030fe:	89 c2                	mov    %eax,%edx
  103100:	89 ce                	mov    %ecx,%esi
  103102:	89 d7                	mov    %edx,%edi
  103104:	ac                   	lods   %ds:(%esi),%al
  103105:	ae                   	scas   %es:(%edi),%al
  103106:	75 08                	jne    103110 <strcmp+0x2e>
  103108:	84 c0                	test   %al,%al
  10310a:	75 f8                	jne    103104 <strcmp+0x22>
  10310c:	31 c0                	xor    %eax,%eax
  10310e:	eb 04                	jmp    103114 <strcmp+0x32>
  103110:	19 c0                	sbb    %eax,%eax
  103112:	0c 01                	or     $0x1,%al
  103114:	89 fa                	mov    %edi,%edx
  103116:	89 f1                	mov    %esi,%ecx
  103118:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10311b:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10311e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  103121:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  103124:	83 c4 20             	add    $0x20,%esp
  103127:	5e                   	pop    %esi
  103128:	5f                   	pop    %edi
  103129:	5d                   	pop    %ebp
  10312a:	c3                   	ret    

0010312b <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  10312b:	55                   	push   %ebp
  10312c:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10312e:	eb 0c                	jmp    10313c <strncmp+0x11>
        n --, s1 ++, s2 ++;
  103130:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103134:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103138:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10313c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103140:	74 1a                	je     10315c <strncmp+0x31>
  103142:	8b 45 08             	mov    0x8(%ebp),%eax
  103145:	0f b6 00             	movzbl (%eax),%eax
  103148:	84 c0                	test   %al,%al
  10314a:	74 10                	je     10315c <strncmp+0x31>
  10314c:	8b 45 08             	mov    0x8(%ebp),%eax
  10314f:	0f b6 10             	movzbl (%eax),%edx
  103152:	8b 45 0c             	mov    0xc(%ebp),%eax
  103155:	0f b6 00             	movzbl (%eax),%eax
  103158:	38 c2                	cmp    %al,%dl
  10315a:	74 d4                	je     103130 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  10315c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103160:	74 18                	je     10317a <strncmp+0x4f>
  103162:	8b 45 08             	mov    0x8(%ebp),%eax
  103165:	0f b6 00             	movzbl (%eax),%eax
  103168:	0f b6 d0             	movzbl %al,%edx
  10316b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10316e:	0f b6 00             	movzbl (%eax),%eax
  103171:	0f b6 c0             	movzbl %al,%eax
  103174:	29 c2                	sub    %eax,%edx
  103176:	89 d0                	mov    %edx,%eax
  103178:	eb 05                	jmp    10317f <strncmp+0x54>
  10317a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10317f:	5d                   	pop    %ebp
  103180:	c3                   	ret    

00103181 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  103181:	55                   	push   %ebp
  103182:	89 e5                	mov    %esp,%ebp
  103184:	83 ec 04             	sub    $0x4,%esp
  103187:	8b 45 0c             	mov    0xc(%ebp),%eax
  10318a:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10318d:	eb 14                	jmp    1031a3 <strchr+0x22>
        if (*s == c) {
  10318f:	8b 45 08             	mov    0x8(%ebp),%eax
  103192:	0f b6 00             	movzbl (%eax),%eax
  103195:	3a 45 fc             	cmp    -0x4(%ebp),%al
  103198:	75 05                	jne    10319f <strchr+0x1e>
            return (char *)s;
  10319a:	8b 45 08             	mov    0x8(%ebp),%eax
  10319d:	eb 13                	jmp    1031b2 <strchr+0x31>
        }
        s ++;
  10319f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  1031a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031a6:	0f b6 00             	movzbl (%eax),%eax
  1031a9:	84 c0                	test   %al,%al
  1031ab:	75 e2                	jne    10318f <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  1031ad:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1031b2:	c9                   	leave  
  1031b3:	c3                   	ret    

001031b4 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1031b4:	55                   	push   %ebp
  1031b5:	89 e5                	mov    %esp,%ebp
  1031b7:	83 ec 04             	sub    $0x4,%esp
  1031ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031bd:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1031c0:	eb 11                	jmp    1031d3 <strfind+0x1f>
        if (*s == c) {
  1031c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c5:	0f b6 00             	movzbl (%eax),%eax
  1031c8:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1031cb:	75 02                	jne    1031cf <strfind+0x1b>
            break;
  1031cd:	eb 0e                	jmp    1031dd <strfind+0x29>
        }
        s ++;
  1031cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  1031d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d6:	0f b6 00             	movzbl (%eax),%eax
  1031d9:	84 c0                	test   %al,%al
  1031db:	75 e5                	jne    1031c2 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  1031dd:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1031e0:	c9                   	leave  
  1031e1:	c3                   	ret    

001031e2 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  1031e2:	55                   	push   %ebp
  1031e3:	89 e5                	mov    %esp,%ebp
  1031e5:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  1031e8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  1031ef:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1031f6:	eb 04                	jmp    1031fc <strtol+0x1a>
        s ++;
  1031f8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1031fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ff:	0f b6 00             	movzbl (%eax),%eax
  103202:	3c 20                	cmp    $0x20,%al
  103204:	74 f2                	je     1031f8 <strtol+0x16>
  103206:	8b 45 08             	mov    0x8(%ebp),%eax
  103209:	0f b6 00             	movzbl (%eax),%eax
  10320c:	3c 09                	cmp    $0x9,%al
  10320e:	74 e8                	je     1031f8 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  103210:	8b 45 08             	mov    0x8(%ebp),%eax
  103213:	0f b6 00             	movzbl (%eax),%eax
  103216:	3c 2b                	cmp    $0x2b,%al
  103218:	75 06                	jne    103220 <strtol+0x3e>
        s ++;
  10321a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10321e:	eb 15                	jmp    103235 <strtol+0x53>
    }
    else if (*s == '-') {
  103220:	8b 45 08             	mov    0x8(%ebp),%eax
  103223:	0f b6 00             	movzbl (%eax),%eax
  103226:	3c 2d                	cmp    $0x2d,%al
  103228:	75 0b                	jne    103235 <strtol+0x53>
        s ++, neg = 1;
  10322a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10322e:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  103235:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103239:	74 06                	je     103241 <strtol+0x5f>
  10323b:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  10323f:	75 24                	jne    103265 <strtol+0x83>
  103241:	8b 45 08             	mov    0x8(%ebp),%eax
  103244:	0f b6 00             	movzbl (%eax),%eax
  103247:	3c 30                	cmp    $0x30,%al
  103249:	75 1a                	jne    103265 <strtol+0x83>
  10324b:	8b 45 08             	mov    0x8(%ebp),%eax
  10324e:	83 c0 01             	add    $0x1,%eax
  103251:	0f b6 00             	movzbl (%eax),%eax
  103254:	3c 78                	cmp    $0x78,%al
  103256:	75 0d                	jne    103265 <strtol+0x83>
        s += 2, base = 16;
  103258:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  10325c:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103263:	eb 2a                	jmp    10328f <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  103265:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103269:	75 17                	jne    103282 <strtol+0xa0>
  10326b:	8b 45 08             	mov    0x8(%ebp),%eax
  10326e:	0f b6 00             	movzbl (%eax),%eax
  103271:	3c 30                	cmp    $0x30,%al
  103273:	75 0d                	jne    103282 <strtol+0xa0>
        s ++, base = 8;
  103275:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103279:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103280:	eb 0d                	jmp    10328f <strtol+0xad>
    }
    else if (base == 0) {
  103282:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103286:	75 07                	jne    10328f <strtol+0xad>
        base = 10;
  103288:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  10328f:	8b 45 08             	mov    0x8(%ebp),%eax
  103292:	0f b6 00             	movzbl (%eax),%eax
  103295:	3c 2f                	cmp    $0x2f,%al
  103297:	7e 1b                	jle    1032b4 <strtol+0xd2>
  103299:	8b 45 08             	mov    0x8(%ebp),%eax
  10329c:	0f b6 00             	movzbl (%eax),%eax
  10329f:	3c 39                	cmp    $0x39,%al
  1032a1:	7f 11                	jg     1032b4 <strtol+0xd2>
            dig = *s - '0';
  1032a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a6:	0f b6 00             	movzbl (%eax),%eax
  1032a9:	0f be c0             	movsbl %al,%eax
  1032ac:	83 e8 30             	sub    $0x30,%eax
  1032af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1032b2:	eb 48                	jmp    1032fc <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1032b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b7:	0f b6 00             	movzbl (%eax),%eax
  1032ba:	3c 60                	cmp    $0x60,%al
  1032bc:	7e 1b                	jle    1032d9 <strtol+0xf7>
  1032be:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c1:	0f b6 00             	movzbl (%eax),%eax
  1032c4:	3c 7a                	cmp    $0x7a,%al
  1032c6:	7f 11                	jg     1032d9 <strtol+0xf7>
            dig = *s - 'a' + 10;
  1032c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1032cb:	0f b6 00             	movzbl (%eax),%eax
  1032ce:	0f be c0             	movsbl %al,%eax
  1032d1:	83 e8 57             	sub    $0x57,%eax
  1032d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1032d7:	eb 23                	jmp    1032fc <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1032d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1032dc:	0f b6 00             	movzbl (%eax),%eax
  1032df:	3c 40                	cmp    $0x40,%al
  1032e1:	7e 3d                	jle    103320 <strtol+0x13e>
  1032e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e6:	0f b6 00             	movzbl (%eax),%eax
  1032e9:	3c 5a                	cmp    $0x5a,%al
  1032eb:	7f 33                	jg     103320 <strtol+0x13e>
            dig = *s - 'A' + 10;
  1032ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f0:	0f b6 00             	movzbl (%eax),%eax
  1032f3:	0f be c0             	movsbl %al,%eax
  1032f6:	83 e8 37             	sub    $0x37,%eax
  1032f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  1032fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032ff:	3b 45 10             	cmp    0x10(%ebp),%eax
  103302:	7c 02                	jl     103306 <strtol+0x124>
            break;
  103304:	eb 1a                	jmp    103320 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  103306:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10330a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10330d:	0f af 45 10          	imul   0x10(%ebp),%eax
  103311:	89 c2                	mov    %eax,%edx
  103313:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103316:	01 d0                	add    %edx,%eax
  103318:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  10331b:	e9 6f ff ff ff       	jmp    10328f <strtol+0xad>

    if (endptr) {
  103320:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103324:	74 08                	je     10332e <strtol+0x14c>
        *endptr = (char *) s;
  103326:	8b 45 0c             	mov    0xc(%ebp),%eax
  103329:	8b 55 08             	mov    0x8(%ebp),%edx
  10332c:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  10332e:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103332:	74 07                	je     10333b <strtol+0x159>
  103334:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103337:	f7 d8                	neg    %eax
  103339:	eb 03                	jmp    10333e <strtol+0x15c>
  10333b:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  10333e:	c9                   	leave  
  10333f:	c3                   	ret    

00103340 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103340:	55                   	push   %ebp
  103341:	89 e5                	mov    %esp,%ebp
  103343:	57                   	push   %edi
  103344:	83 ec 24             	sub    $0x24,%esp
  103347:	8b 45 0c             	mov    0xc(%ebp),%eax
  10334a:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  10334d:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  103351:	8b 55 08             	mov    0x8(%ebp),%edx
  103354:	89 55 f8             	mov    %edx,-0x8(%ebp)
  103357:	88 45 f7             	mov    %al,-0x9(%ebp)
  10335a:	8b 45 10             	mov    0x10(%ebp),%eax
  10335d:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103360:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  103363:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  103367:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10336a:	89 d7                	mov    %edx,%edi
  10336c:	f3 aa                	rep stos %al,%es:(%edi)
  10336e:	89 fa                	mov    %edi,%edx
  103370:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103373:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  103376:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103379:	83 c4 24             	add    $0x24,%esp
  10337c:	5f                   	pop    %edi
  10337d:	5d                   	pop    %ebp
  10337e:	c3                   	ret    

0010337f <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  10337f:	55                   	push   %ebp
  103380:	89 e5                	mov    %esp,%ebp
  103382:	57                   	push   %edi
  103383:	56                   	push   %esi
  103384:	53                   	push   %ebx
  103385:	83 ec 30             	sub    $0x30,%esp
  103388:	8b 45 08             	mov    0x8(%ebp),%eax
  10338b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10338e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103391:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103394:	8b 45 10             	mov    0x10(%ebp),%eax
  103397:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  10339a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10339d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1033a0:	73 42                	jae    1033e4 <memmove+0x65>
  1033a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1033a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033ab:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1033ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033b1:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1033b4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1033b7:	c1 e8 02             	shr    $0x2,%eax
  1033ba:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1033bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1033bf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033c2:	89 d7                	mov    %edx,%edi
  1033c4:	89 c6                	mov    %eax,%esi
  1033c6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1033c8:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1033cb:	83 e1 03             	and    $0x3,%ecx
  1033ce:	74 02                	je     1033d2 <memmove+0x53>
  1033d0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1033d2:	89 f0                	mov    %esi,%eax
  1033d4:	89 fa                	mov    %edi,%edx
  1033d6:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1033d9:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1033dc:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1033df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1033e2:	eb 36                	jmp    10341a <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1033e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033e7:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033ed:	01 c2                	add    %eax,%edx
  1033ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033f2:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1033f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033f8:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  1033fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033fe:	89 c1                	mov    %eax,%ecx
  103400:	89 d8                	mov    %ebx,%eax
  103402:	89 d6                	mov    %edx,%esi
  103404:	89 c7                	mov    %eax,%edi
  103406:	fd                   	std    
  103407:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103409:	fc                   	cld    
  10340a:	89 f8                	mov    %edi,%eax
  10340c:	89 f2                	mov    %esi,%edx
  10340e:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103411:	89 55 c8             	mov    %edx,-0x38(%ebp)
  103414:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  103417:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  10341a:	83 c4 30             	add    $0x30,%esp
  10341d:	5b                   	pop    %ebx
  10341e:	5e                   	pop    %esi
  10341f:	5f                   	pop    %edi
  103420:	5d                   	pop    %ebp
  103421:	c3                   	ret    

00103422 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103422:	55                   	push   %ebp
  103423:	89 e5                	mov    %esp,%ebp
  103425:	57                   	push   %edi
  103426:	56                   	push   %esi
  103427:	83 ec 20             	sub    $0x20,%esp
  10342a:	8b 45 08             	mov    0x8(%ebp),%eax
  10342d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103430:	8b 45 0c             	mov    0xc(%ebp),%eax
  103433:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103436:	8b 45 10             	mov    0x10(%ebp),%eax
  103439:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10343c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10343f:	c1 e8 02             	shr    $0x2,%eax
  103442:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103444:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103447:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10344a:	89 d7                	mov    %edx,%edi
  10344c:	89 c6                	mov    %eax,%esi
  10344e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103450:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103453:	83 e1 03             	and    $0x3,%ecx
  103456:	74 02                	je     10345a <memcpy+0x38>
  103458:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10345a:	89 f0                	mov    %esi,%eax
  10345c:	89 fa                	mov    %edi,%edx
  10345e:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103461:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103464:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103467:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  10346a:	83 c4 20             	add    $0x20,%esp
  10346d:	5e                   	pop    %esi
  10346e:	5f                   	pop    %edi
  10346f:	5d                   	pop    %ebp
  103470:	c3                   	ret    

00103471 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103471:	55                   	push   %ebp
  103472:	89 e5                	mov    %esp,%ebp
  103474:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  103477:	8b 45 08             	mov    0x8(%ebp),%eax
  10347a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  10347d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103480:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  103483:	eb 30                	jmp    1034b5 <memcmp+0x44>
        if (*s1 != *s2) {
  103485:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103488:	0f b6 10             	movzbl (%eax),%edx
  10348b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10348e:	0f b6 00             	movzbl (%eax),%eax
  103491:	38 c2                	cmp    %al,%dl
  103493:	74 18                	je     1034ad <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  103495:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103498:	0f b6 00             	movzbl (%eax),%eax
  10349b:	0f b6 d0             	movzbl %al,%edx
  10349e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1034a1:	0f b6 00             	movzbl (%eax),%eax
  1034a4:	0f b6 c0             	movzbl %al,%eax
  1034a7:	29 c2                	sub    %eax,%edx
  1034a9:	89 d0                	mov    %edx,%eax
  1034ab:	eb 1a                	jmp    1034c7 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  1034ad:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1034b1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  1034b5:	8b 45 10             	mov    0x10(%ebp),%eax
  1034b8:	8d 50 ff             	lea    -0x1(%eax),%edx
  1034bb:	89 55 10             	mov    %edx,0x10(%ebp)
  1034be:	85 c0                	test   %eax,%eax
  1034c0:	75 c3                	jne    103485 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  1034c2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1034c7:	c9                   	leave  
  1034c8:	c3                   	ret    
