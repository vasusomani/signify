import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signify/model/user_model.dart';

class FreelancerNotifier extends StateNotifier<UserModel?> {
  FreelancerNotifier() : super(null);

  setFreelancer(UserModel user) {
    state = user;
  }

  removeFreelancer() {
    state = null;
  }
}

final freelancerUserProvider =
    StateNotifierProvider<FreelancerNotifier, UserModel?>(
        (ref) => FreelancerNotifier());
