// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebooktask/config/palette.dart';
import 'package:flutter_facebooktask/data/data.dart';
import 'package:flutter_facebooktask/models/post_model.dart';
import 'package:flutter_facebooktask/screens/cubit/cubit.dart';
import 'package:flutter_facebooktask/screens/cubit/states.dart';
import 'package:flutter_facebooktask/widgets/circle_button.dart';
import 'package:flutter_facebooktask/widgets/contacts_list.dart';
import 'package:flutter_facebooktask/widgets/create_post_container.dart';
import 'package:flutter_facebooktask/widgets/more_options_list.dart';
import 'package:flutter_facebooktask/widgets/post_container.dart';
import 'package:flutter_facebooktask/widgets/responsive.dart';
import 'package:flutter_facebooktask/widgets/rooms.dart';
import 'package:flutter_facebooktask/widgets/stories.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) => SocialCubit()..allposts(),
        child: BlocConsumer<SocialCubit, SocialStates>(
          listener: (BuildContext context, SocialStates state) {},
          builder: (BuildContext context, SocialStates state) {
            return Scaffold(
              body: Responsive(
                mobile: _HomeScreenMobile(
                    scrollController: _trackingScrollController),
                desktop: _HomeScreenDesktop(
                    scrollController: _trackingScrollController),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          // ignore: deprecated_member_use
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'facebook',
            style: const TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              // ignore: avoid_print
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              // ignore: avoid_print
              onPressed: () => print('Messenger'),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        BlocConsumer<SocialCubit, SocialStates>(
            listener: (BuildContext context, SocialStates state) {},
            builder: (BuildContext context, SocialStates state) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post =
                        SocialCubit.get(context).socialposts[index];
                    print(SocialCubit.get(context).socialposts[index]);
                    return  PostContainer(post: post);
                  },
                  childCount: SocialCubit.get(context).socialposts.length,
                ),
              );
            }),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        // ignore: sized_box_for_whitespace
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
               BlocConsumer<SocialCubit, SocialStates>(
            listener: (BuildContext context, SocialStates state) {},
            builder: (BuildContext context, SocialStates state) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post =
                        SocialCubit.get(context).socialposts[index];
                    print(SocialCubit.get(context).socialposts[index]);
                    return
                         PostContainer(post: post);
                  },
                  childCount: SocialCubit.get(context).socialposts.length,
                ),
              );
            }),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
