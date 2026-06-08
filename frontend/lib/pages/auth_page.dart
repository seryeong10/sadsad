import 'dart:async';

import 'package:flutter/material.dart';

import '../services/auth_store.dart';
import '../theme/app_colors.dart';
import 'gender_select_page.dart';

class LoginPage extends StatefulWidget {
  final String initialId;

  const LoginPage({
    super.key,
    this.initialId = '',
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _idController;
  final TextEditingController _passwordController = TextEditingController();
  bool _saveId = true;
  bool _obscurePassword = true;
  bool _isLoggingIn = false;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController(text: widget.initialId);
    _loadSavedId();
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 24, 30, 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 12),
                  const _AvataLogo(size: 104),
                  const SizedBox(height: 12),
                  const Text(
                    '나에게 딱 맞는 스타일을 찾아보세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 34),
                  _LabeledField(
                    label: '아이디',
                    controller: _idController,
                    hintText: '아이디를 입력해주세요',
                  ),
                  const SizedBox(height: 22),
                  _LabeledField(
                    label: '비밀번호',
                    controller: _passwordController,
                    hintText: '비밀번호를 입력해주세요',
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.muted,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _saveId = !_saveId),
                        child: Icon(
                          _saveId
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: _saveId ? AppColors.main : AppColors.line,
                          size: 21,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '아이디 저장',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.ink,
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          '비밀번호 찾기',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  _OliveButton(
                    text: '로그인',
                    isLoading: _isLoggingIn,
                    onPressed: _isLoggingIn ? null : () => _login(),
                  ),
                  const SizedBox(height: 14),
                  const _KakaoLoginButton(),
                  const SizedBox(height: 31),
                  const Text(
                    '아직 계정이 없으신가요?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        '회원가입하기',
                        style: TextStyle(
                          color: AppColors.main,
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (_isLoggingIn) return;

    final id = _idController.text.trim();
    final password = _passwordController.text;

    if (id.isEmpty || password.isEmpty) {
      _showSnackBar('아이디와 비밀번호를 입력해주세요.');
      return;
    }

    setState(() => _isLoggingIn = true);
    final result = await AuthStore.login(
      id: id,
      password: password,
      saveId: _saveId,
    );
    if (!mounted) return;
    setState(() => _isLoggingIn = false);

    if (!result.isSuccess) {
      _showSnackBar(result.message ?? '아이디 또는 비밀번호가 맞지 않아요.');
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const GenderSelectPage()),
    );
  }

  Future<void> _loadSavedId() async {
    if (widget.initialId.isNotEmpty) return;

    final savedId = await AuthStore.savedLoginId();
    if (!mounted || savedId.isEmpty) return;

    setState(() {
      _idController.text = savedId;
      _saveId = true;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedTerms = true;
  bool _agreedPrivacy = true;
  bool _isCheckingId = false;
  bool _isSigningUp = false;
  String? _idCheckMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(27, 12, 27, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new, size: 21),
                ),
              ),
              const _AvataLogo(size: 68, compact: true),
              const SizedBox(height: 8),
              const Text(
                '회원가입',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                '기본 정보를 입력하고\n나에게 딱 맞는 스타일을 경험해보세요.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  height: 1.55,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              _LabeledField(
                label: '이름',
                controller: _nameController,
                hintText: '이름을 입력해주세요',
              ),
              const SizedBox(height: 20),
              _SignUpIdField(
                controller: _idController,
                message: _idCheckMessage,
                isChecking: _isCheckingId,
                onCheck: _isCheckingId ? null : () => _checkId(),
              ),
              const SizedBox(height: 20),
              _LabeledField(
                label: '비밀번호',
                controller: _passwordController,
                hintText: '비밀번호를 입력해주세요',
                helperText: '영문, 숫자, 특수문자 포함 8~16자',
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.muted,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _LabeledField(
                label: '비밀번호 확인',
                controller: _passwordConfirmController,
                hintText: '비밀번호를 다시 입력해주세요',
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword,
                    );
                  },
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.muted,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              _AgreementTile(
                text: '이용약관에 동의합니다. (필수)',
                selected: _agreedTerms,
                onTap: () => setState(() => _agreedTerms = !_agreedTerms),
              ),
              const SizedBox(height: 11),
              _AgreementTile(
                text: '개인정보 수집 및 이용에 동의합니다. (필수)',
                selected: _agreedPrivacy,
                onTap: () => setState(() => _agreedPrivacy = !_agreedPrivacy),
              ),
              const SizedBox(height: 26),
              _OliveButton(
                text: '회원가입',
                isLoading: _isSigningUp,
                onPressed: _isSigningUp ? null : () => _signUp(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '이미 계정이 있으신가요?',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.main,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      minimumSize: const Size(0, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      '로그인하기',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _checkId() async {
    if (_isCheckingId) return;

    final id = _idController.text.trim();
    if (id.length < 4) {
      setState(() => _idCheckMessage = '아이디는 4자 이상 입력해주세요.');
      return;
    }

    setState(() => _isCheckingId = true);
    final isAvailable = await AuthStore.isIdAvailable(id);
    if (!mounted) return;

    setState(() {
      _isCheckingId = false;
      _idCheckMessage = isAvailable ? '사용 가능한 아이디예요.' : '이미 사용 중인 아이디예요.';
    });
  }

  Future<void> _signUp() async {
    if (_isSigningUp) return;

    final name = _nameController.text.trim();
    final id = _idController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _passwordConfirmController.text;

    if (name.isEmpty || id.isEmpty || password.isEmpty) {
      _showSnackBar('이름, 아이디, 비밀번호를 입력해주세요.');
      return;
    }
    if (id.length < 4 || id.length > 16) {
      _showSnackBar('아이디는 4~16자로 입력해주세요.');
      return;
    }
    if (password.length < 8 || password.length > 16) {
      _showSnackBar('비밀번호는 8~16자로 입력해주세요.');
      return;
    }
    if (!_hasRequiredPasswordMix(password)) {
      _showSnackBar('비밀번호는 영문, 숫자, 특수문자를 모두 포함해주세요.');
      return;
    }
    if (password != confirmPassword) {
      _showSnackBar('비밀번호가 서로 달라요.');
      return;
    }
    if (!_agreedTerms || !_agreedPrivacy) {
      _showSnackBar('필수 약관에 동의해주세요.');
      return;
    }

    setState(() => _isSigningUp = true);
    final result = await AuthStore.signUp(
      name: name,
      id: id,
      password: password,
    );
    if (!mounted) return;
    setState(() => _isSigningUp = false);

    if (!result.isSuccess) {
      _showSnackBar(result.message ?? '이미 사용 중인 아이디예요.');
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => SignUpCompletePage(id: id),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  bool _hasRequiredPasswordMix(String password) {
    return RegExp(r'[A-Za-z]').hasMatch(password) &&
        RegExp(r'\d').hasMatch(password) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=~`[\]\\;/]').hasMatch(password);
  }
}

class SignUpCompletePage extends StatefulWidget {
  final String id;

  const SignUpCompletePage({
    super.key,
    required this.id,
  });

  @override
  State<SignUpCompletePage> createState() => _SignUpCompletePageState();
}

class _SignUpCompletePageState extends State<SignUpCompletePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginPage(initialId: widget.id),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 42,
                backgroundColor: AppColors.point,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              SizedBox(height: 23),
              Text(
                '회원가입 완료',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvataLogo extends StatelessWidget {
  final double size;
  final bool compact;

  const _AvataLogo({
    required this.size,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.checkroom_outlined,
          color: AppColors.main,
          size: size * 0.56,
        ),
        SizedBox(height: compact ? 0 : 5),
        Text(
          'A-VATA',
          style: TextStyle(
            color: AppColors.main,
            fontSize: compact ? 13 : 32,
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final String? helperText;
  final bool obscureText;
  final Widget? suffixIcon;

  const _LabeledField({
    required this.label,
    required this.controller,
    required this.hintText,
    this.helperText,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.ink,
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 9),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xffb6bab0),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 15,
            ),
            enabledBorder: _fieldBorder(AppColors.line),
            focusedBorder: _fieldBorder(AppColors.main),
          ),
        ),
        if (helperText != null) ...[
          const SizedBox(height: 7),
          Text(
            helperText!,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}

class _SignUpIdField extends StatelessWidget {
  final TextEditingController controller;
  final String? message;
  final bool isChecking;
  final VoidCallback? onCheck;

  const _SignUpIdField({
    required this.controller,
    required this.message,
    required this.isChecking,
    required this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '아이디',
          style: TextStyle(
            color: AppColors.ink,
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 9),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: '아이디를 입력해주세요',
                  hintStyle: const TextStyle(
                    color: Color(0xffb6bab0),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 15,
                  ),
                  enabledBorder: _fieldBorder(AppColors.line),
                  focusedBorder: _fieldBorder(AppColors.main),
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 86,
              height: 52,
              child: OutlinedButton(
                onPressed: onCheck,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.main,
                  side: const BorderSide(color: AppColors.main),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: isChecking
                    ? const SizedBox(
                        width: 17,
                        height: 17,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.main,
                        ),
                      )
                    : const Text(
                        '중복확인',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Text(
          message ?? '영문, 숫자 4~16자',
          style: TextStyle(
            color: message == null
                ? AppColors.muted
                : message!.startsWith('사용')
                    ? AppColors.main
                    : Colors.redAccent,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _AgreementTile extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _AgreementTile({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            selected ? Icons.check_circle : Icons.radio_button_unchecked,
            color: selected ? AppColors.main : AppColors.line,
            size: 21,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.ink,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.muted, size: 22),
        ],
      ),
    );
  }
}

class _OliveButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;

  const _OliveButton({
    required this.text,
    this.isLoading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.main,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.3,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
      ),
    );
  }
}

class _KakaoLoginButton extends StatelessWidget {
  const _KakaoLoginButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('카카오 로그인은 다음 단계에서 연결할게요.')),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xffffe812),
          foregroundColor: const Color(0xff191600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble, size: 19),
            SizedBox(width: 10),
            Text(
              '카카오로 계속하기',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder _fieldBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color),
  );
}
